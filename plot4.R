power2 <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")
name <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
names(power2) <- name
power2$DateTime <- strptime(paste(power2$Date, power2$Time), format="%d/%m/%Y %H:%M:%S")
for( i in 3:9 ){
    power2[[i]] <- sapply(power2[[i]], as.character)
    power2[[i]] <- sapply(power2[[i]], as.numeric)
}
win.graph(200,200)
par(mfcol = c(2,2))
with(power2, {plot(DateTime, Global_active_power, type = "n", xlab = "daytime", ylab = "Global Active Power (kilowatts)" , axes = F, frame.plot=TRUE)
          axis(1, at=c(as.numeric(min(power2$DateTime)), as.numeric(min(power2$DateTime))+86400, as.numeric(min(power2$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
          axis(2, yaxs = "r")
          with(power2, points(DateTime, Global_active_power, type = "l"))
          plot(DateTime, Sub_metering_1, type = "n", xlab = "daytime", ylab = "Energy sub metering" , axes = F, frame.plot=TRUE)
          axis(1, at=c(as.numeric(min(power2$DateTime)), as.numeric(min(power2$DateTime))+86400
                       , as.numeric(min(power2$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
          axis(2, yaxs = "r")
          with(power2, points(DateTime, Sub_metering_1, type = "l"))
          with(power2, points(DateTime, Sub_metering_2, type = "l", col = "red"))
          with(power2, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
          legend("topright", pch = "¢w", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))          
          plot(DateTime, Voltage, type = "n", xlab = "daytime", ylab = "Voltage (volts)" , axes = F, frame.plot=TRUE)
          axis(1, at=c(as.numeric(min(power2$DateTime)), as.numeric(min(power2$DateTime))+86400
             , as.numeric(min(power2$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
          axis(2, yaxs = "r")
          with(power2, points(DateTime, Voltage, type = "l"))
          plot(DateTime, Global_reactive_power, type = "n", xlab = "daytime", ylab = "Global Reactive Power (kilowatts)" , axes = F, frame.plot=TRUE)
          axis(1, at=c(as.numeric(min(power2$DateTime)), as.numeric(min(power2$DateTime))+86400
             , as.numeric(min(power2$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
          axis(2, yaxs = "r")
          with(power2, points(DateTime, Global_reactive_power, type = "l"))
          })
##save the chart
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
