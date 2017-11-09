hpower <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = T)

hpower1 <- hpower[hpower$Date == "1/2/2007"| hpower$Date == "2/2/2007", ]

png("plot4.png")

day <- strptime(paste(hpower1$Date, hpower1$Time ), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

plot(day, as.numeric (hpower1$Global_active_power), type= "l", xlab = "", ylab ="Global Active Power (kilowatts)" )

plot(day, as.numeric (hpower1$Voltage), type= "l", xlab = "datetime", ylab ="Voltage" )

plot(day, as.numeric (hpower1$Sub_metering_1), type= "l", xlab = "", ylab ="Energy sub metering" )

lines(day, as.numeric (hpower1$Sub_metering_2), type = "l", col = "red")

lines(day, as.numeric (hpower1$Sub_metering_3), type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty ="n", lwd = 2, col = c("black", "red", "blue"))

plot(day, as.numeric (hpower1$Global_reactive_power), type= "l", xlab = "datetime", ylab ="Global_reactive_power" )


dev.off()