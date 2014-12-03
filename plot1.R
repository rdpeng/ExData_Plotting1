##Plot 1

powerData <- readRDS("powerData.rda")
png(file = "plot1.png", width = 480, height = 480)
hist(powerData$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
