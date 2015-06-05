## Multi-plot in four quadrants of Household Power Consumption data
## Filter Dates are 2007-02-01 and 2007-02-02

## IMPORTANT NOTE: Data file needs to be in current working directory

plot4 <- function() {
    ## [Part 1] Read in the data
    dataFile <- "household_power_consumption.txt"
    hpc <- read.table(file=dataFile, header=FALSE, sep = ";",
                      nrows = 2880, skip = 66637)
    
    ## [Part 2] Clean and format the data
    ## Label the data frame
    names <- c("Date","Time","Global_active_power","Global_reactive_power",
               "Voltage","V6",
               "Sub_metering_1","Sub_metering_2","Sub_metering_3")
    names(hpc) <- names
    hpc$Datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
    
    ## [Part 3] Plot sub metering data in black, red, and blue
    ## First, set plot device, Width of 480 pixels, and a height of 480 pixels
    png("plot4.png", width = 480, height = 480)
    
    par(mfrow = c(2, 2)) ## Setup four quadrants for plots
    with (hpc, {
        ## Plot 1
        plot(hpc$Datetime, hpc$Global_active_power, 
             ylab="Global Active Power (kilowats)", xlab="", type = "n")
        lines(hpc$Datetime, hpc$Global_active_power)
        ## Plot 2
        plot(hpc$Datetime, hpc$Voltage, 
             ylab="Voltage", xlab="datetime", type = "n")
        lines(hpc$Datetime, hpc$Voltage)
        ## Plot 3
        plot(hpc$Datetime, hpc$Sub_metering_1, 
             ylab="Energy sub metering", xlab="", type = "n")
        lines(hpc$Datetime, hpc$Sub_metering_1)
        lines(hpc$Datetime, hpc$Sub_metering_2, col = "red")
        lines(hpc$Datetime, hpc$Sub_metering_3, col = "blue")
        legend("topright", 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty = c(1, 1, 1), ## Gives legend appropriate symbols (lines)
               col = c("black","blue", "red"))
        ## Plot 4
        plot(hpc$Datetime, hpc$Global_reactive_power, 
             ylab="Global_reactive_power", xlab="datetime", type = "n")
        lines(hpc$Datetime, hpc$Global_reactive_power)
    })
    
    ## [Part 4] Close Connection
    dev.off()
}