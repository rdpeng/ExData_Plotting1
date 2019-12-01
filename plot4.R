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

addPlot1 <- function(powerDataSet) {
    #Plot Global_active_power vs DateTime with type = "n" signifying that points shouldn't be displayed on the plot
    plot(Global_active_power ~ DateTime, data = powerDataSet, xlab = "", ylab = "Global Active Power", type = "n")
    lines(Global_active_power ~ DateTime, data = powerDataSet, col = "orange")
}

addPlot2 <- function(powerDataSet) {
    #Plot Enerygy Metering vs DateTime with type = "n" signifying that points shouldn't be displayed on the plot
    plot(Sub_metering_1 ~ DateTime, data = powerDataSet, xlab = "", ylab = "Energy sub metering", type = "n")
    lines(Sub_metering_1 ~ DateTime, data = powerDataSet, col = "black")
    lines(Sub_metering_2 ~ DateTime, data = powerDataSet, col = "red")
    lines(Sub_metering_3 ~ DateTime, data = powerDataSet, col = "blue")
    
    #Add a legend indicating the coloring schemes
    legend_text <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    legend("topright", lty = 1, lwd = , col = c("black", "red", "blue"), bty = "n",
           legend = legend_text, cex = 0.75, text.width = strwidth(legend_text)[1]/3.5)
}

addPlot3 <- function(powerDataSet) {
    #Plot Voltage vs DateTime with type = "n" signifying that points shouldn't be displayed on the plot
    plot(Voltage ~ DateTime, data = powerDataSet, xlab = "datetime", ylab = "Voltage", type = "n")
    lines(Voltage ~ DateTime, data = powerDataSet, col = "magenta")
}

addPlot4 <- function(powerDataSet) {
    #Plot Global_reactive_power vs DateTime with type = "n" signifying that points shouldn't be displayed on the plot
    plot(Global_reactive_power ~ DateTime, data = powerDataSet, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
    lines(Global_reactive_power ~ DateTime, data = powerDataSet, col = "green")
}

plot4 <- function() {
    powerDataSet <- getDataSet()
    
    #View DataSet
    View(powerDataSet)
    
    par(mfcol = c(2, 2), mar = c(5, 5, 1, 1), oma = c(0, 0, 2, 0))
    
    #Add Plots 1 through 4
    addPlot1(powerDataSet)
    addPlot2(powerDataSet)
    addPlot3(powerDataSet)
    addPlot4(powerDataSet)
    
    #Copy the Plot to plot1.png file and close the png file
    dev.copy(png, "plot4.png", width = 480, height = 480)
    dev.off()
}