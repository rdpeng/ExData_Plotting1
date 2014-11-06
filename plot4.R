## Before loading data, check if there exists require data
## Load data using a main R script so that any changes to loading of data only require to change on 1 single location
if (!exists("requireData")){
  source("loadConsumptionData.R")
}

png(file = "plot4.png", width = 480, height = 480)
## Set the plot with 2 columns and 2 rows
par(mfrow=c(2,2))
## plot first graph
plot(requireData$newDateTime, requireData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
## plot second graph
plot(requireData$newDateTime, requireData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## plot thrid graph
## Plot the main graph with sub_metering_1
plot(requireData$newDateTime, requireData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
## Add in sub_metering_2 using line into the plot to combine 2 plot with red color
lines(requireData$newDateTime, requireData$Sub_metering_2, col = "red")
## Add in sub_metering_3 into plot with blue color
lines(requireData$newDateTime, requireData$Sub_metering_3, col = "blue")
## Adding legend into graph
## 
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty = c(1,1,1), lwd = c(1,1,1), col=c("black","red","blue"))

## plot fourth graph
plot(requireData$newDateTime, requireData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()