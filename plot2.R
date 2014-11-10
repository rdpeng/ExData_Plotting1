## Before loading data, check if there exists require data
## Load data using a main R script so that any changes to loading of data only require to change on 1 single location
if (!exists("requireData")){
  source("loadConsumptionData.R")
}
## Plot the line graph base on Global Active Power and DateTime
png(file = "plot2.png", width = 480, height = 480)
plot(requireData$newDateTime, requireData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()