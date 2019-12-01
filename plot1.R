getDataSet <- function() {
    library(sqldf)
    library(dplyr)
    library(lubridate)
    
    #Read from the file with dates matching '1/2/2007' OR '2/2/2007'
    query_string <- "Select * from file where Date == '1/2/2007' OR Date == '2/2/2007' "
    powerDataSet <- read.csv.sql("household_power_consumption.txt", sql = query_string, header = TRUE, sep = ";")
    
    #Add a new column to merge Date and Time
    powerDataSet <- mutate(powerDataSet, DateTime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
    
    #Return
    powerDataSet
}

plotHistogram <- function(powerDataSet) {
    #Plotting histogram
    hist(powerDataSet$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
    
    #Drawing distribution points
    rug(powerDataSet$Global_active_power)
    
    #Draw a vertical line to show the meadian
    abline(v = median(powerDataSet$Global_active_power), col = "yellow", lwd = 4)
    
    #Copy the Plot to plot1.png file and close the png file
    dev.copy(png, "plot1.png", width = 480, height = 480)
    dev.off()
}

plot1 <- function() {
    powerDataSet <- getDataSet()
    
    #View DataSet
    View(powerDataSet)
    
    #Plot a histogram
    plotHistogram(powerDataSet)
}