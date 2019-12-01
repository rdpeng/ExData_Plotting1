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

plotPowerVsDateTime <- function(powerDataSet) {
    #Plot Global_active_power vs DateTime with type = "n" signifying that points shouldn't be displayed on the plot
    plot(Global_active_power ~ DateTime, data = powerDataSet, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
    lines(Global_active_power ~ DateTime, data = powerDataSet)
    
    #Copy the Plot to plot1.png file and close the png file
    dev.copy(png, "plot2.png", width = 480, height = 480)
    dev.off()
}

plot2 <- function() {
    powerDataSet <- getDataSet()
    
    #View DataSet
    View(powerDataSet)
    
    #Plot Global_active_power vs DateTime
    plotPowerVsDateTime(powerDataSet)
}