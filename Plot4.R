setwd("~/Documents/Research/Research_Courses/Coursera - Explore")

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                    na.strings = "?", colClasses = c("character", "character", "numeric", 
                                                     "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
pow_subp1 <- power[power$Date == "1/2/2007",]
pow_subp2 <- power[power$Date == "2/2/2007",]
power_sub <- rbind(pow_subp1, pow_subp2)
DateTime <- data.frame()
DateTime <- paste(power_sub$Date, power_sub$Time)
power_sub <- cbind(DateTime, power_sub)
power_sub$Date <- NULL
power_sub$Time <- NULL
power_sub$DateTime <- strptime(power_sub$DateTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png")

par(mfcol = c(2,2))

plot(power_sub$DateTime, power_sub$Global_active_power, type = "n",
     cex.lab = 0.75, cex.axis = 0.75,
     xlab = "Voltage", ylab = "Global Active Power (kilowatts)")
lines(power_sub$DateTime, power_sub$Global_active_power)

plot(power_sub$DateTime, power_sub$Sub_metering_1, type = "n",
     cex.lab = 0.75, cex.axis = 0.75,
     xlab = "", ylab = "Energy sub metering")
lines(power_sub$DateTime, power_sub$Sub_metering_1, col = "black")
lines(power_sub$DateTime, power_sub$Sub_metering_2, col = "red")
lines(power_sub$DateTime, power_sub$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(power_sub$DateTime, power_sub$Voltage, type = "n",
     cex.lab = 0.75, cex.axis = 0.75,
     xlab = "datetime")
lines(power_sub$DateTime, power_sub$Voltage, col = "black")

plot(power_sub$DateTime, power_sub$Global_reactive_power, type = "n",
     cex.lab = 0.75, cex.axis = 0.75,
     xlab = "datetime")
lines(power_sub$DateTime, power_sub$Global_reactive_power, col = "black")

dev.off()
