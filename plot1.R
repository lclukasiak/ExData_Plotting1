## Plot of Global Active Power
## Data used is sourced from the UC Irvine Machine Learning Repository
## Particular data used is the "Individual household electric power
##      consumption Data Set"
## Filter Dates are 2007-02-01 and 2007-02-02

## IMPORTANT NOTE: Data file needs to be in current working directory

plot1 <- function() {
    library(dplyr)
    ## [Part 1] Read in the data for household electric power consumption

    dataFile <- "household_power_consumption.txt"
    hpc <- read.table(file=dataFile, header=FALSE, sep = ";",
        nrows = 2880, skip = 66637)
    
    ## [Part 2] Clean and format the data
    ## Label the data frame
    names <- c("Date","Time","Global_active_power","V4","V5","V6","V7","V8",
               "V9")
    names(hpc) <- names
    
    ## [Part 3] Plot data
    ## X Axis - Global Active Power (kilowatts)
    ## Y-Axis - Frequency
    png("plot1.png", width = 480, height = 480)
    hist(as.numeric(hpc$Global_active_power), col="red", 
        xlab="Global Active Power (kilowats)", main="Global Active Power")
    
    ## [Part 4] Close the device connection
    dev.off()
}