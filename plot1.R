## Before loading data, check if there exists require data
## Load data using a main R script so that any changes to loading of data only require to change on 1 single location
if (!exists("requireData")){
  source("loadConsumptionData.R")
}
## Plot histogram & save into png format
png(file = "plot1.png", width = 480, height = 480)
hist(requireData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()