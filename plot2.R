##Plot 2

powerData <- readRDS("powerData.rds")
png(file = "plot2.png", width = 480, height = 480)
plot(powerData$Date_time, powerData$Global_active_power, type = "l",
     xlab = "", ylab = "Gobal Active Power (kilowatts)")
dev.off()
