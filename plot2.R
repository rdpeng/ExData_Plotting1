##Plot 2

powerData <- readRDS("powerData.rda")
png(file = "plot2.png", width = 480, height = 480)
plot(powerData$Datetime, powerData$Global_active_power, type = "l",
     xlab = "", ylab = "Gobal Active Power (kilowatts)")
dev.off()
