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

plotEnergyMeteringVsDateTime <- function(powerDataSet) {
    #Plot Enerygy Metering vs DateTime with type = "n" signifying that points shouldn't be displayed on the plot
    plot(Sub_metering_1 ~ DateTime, data = powerDataSet, xlab = "", ylab = "Energy sub metering", type = "n")
    lines(Sub_metering_1 ~ DateTime, data = powerDataSet, col = "black")
    lines(Sub_metering_2 ~ DateTime, data = powerDataSet, col = "red")
    lines(Sub_metering_3 ~ DateTime, data = powerDataSet, col = "blue")
    
    #Add a legend indicating the coloring schemes
    legend_text <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    legend("topright", lty = 1, lwd = , col = c("black", "red", "blue"), 
           legend = legend_text, cex = 0.75, text.width = strwidth(legend_text)[1]/2.8)
    
    #Copy the Plot to plot1.png file and close the png file
    dev.copy(png, "plot3.png", width = 480, height = 480)
    dev.off()
}

plot3 <- function() {
    powerDataSet <- getDataSet()
    
    #View DataSet
    View(powerDataSet)
    
    #Plot Global_active_power vs DateTime
    plotEnergyMeteringVsDateTime(powerDataSet)
}