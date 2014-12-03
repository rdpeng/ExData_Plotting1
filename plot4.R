##Plot 4

powerData <- readRDS("powerData.rda")
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(powerData$Datetime, powerData$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")
plot(powerData$Datetime, powerData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(powerData$Datetime, powerData$Sub_metering_1, col = "darkgrey", type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(powerData$Datetime, powerData$Sub_metering_2, col = "red")
lines(powerData$Datetime, powerData$Sub_metering_3, col = "blue")
legend("topright", pch =1 , col = c("darkgrey", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(powerData$Datetime, powerData$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
