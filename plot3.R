## Before loading data, check if there exists require data
## Load data using a main R script so that any changes to loading of data only require to change on 1 single location
if (!exists("requireData")){
  source("loadConsumptionData.R")
}
png(file = "plot3.png", width = 480, height = 480)
## Plot the main graph with sub_metering_1
plot(requireData$newDateTime, requireData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
## Add in sub_metering_2 using line into the plot to combine 2 plot with red color
lines(requireData$newDateTime, requireData$Sub_metering_2, col ="red")
## Add in sub_metering_3 into plot with blue color
lines(requireData$newDateTime, requireData$Sub_metering_3, col ="blue")
## Adding legend into graph
## 
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = c(1,1,1), col = c("black","red","blue"))
dev.off()
