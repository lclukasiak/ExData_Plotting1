## Line plot of Global Active Power by time for period
## Filter Dates are 2007-02-01 and 2007-02-02

## IMPORTANT NOTE: Data file needs to be in current working directory

plot2 <- function() {
    ## Plot is shown as a line graph
    ## Filter Dates are 2007-02-01 and 2007-02-02
    
    ## [Part 1] Read in data for household electric power consumption
    dataFile <- "household_power_consumption.txt"
    hpc <- read.table(file=dataFile, header=FALSE, sep = ";",
                      nrows = 2880, skip = 66637)
    
    ## [Part 2] Clean up and format Data
    ## Label the data frame
    ## Clean and/or label data
    names <- c("Date","Time","Global_active_power","V4","V5","V6","V7","V8",
               "V9")
    names(hpc) <- names
    hpc$Datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
    
    ## [Part 3] Set plot device and plot the Data
    ## First, set plot device, Width of 480 pixels, and a height of 480 pixels
    png("plot2.png", width = 480, height = 480)
    
    ## Plots the Days of Week (x-axis) against Global Active Power (y-axis)
    plot(hpc$Datetime, hpc$Global_active_power, 
         ylab="Global Active Power (kilowats)", xlab="", type = "n")
    lines(hpc$Datetime, hpc$Global_active_power)
    
    ## [Part 4] Close plot device connection
    dev.off()
}
