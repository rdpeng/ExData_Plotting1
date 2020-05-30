file<-"./data.txt"
t<-read.table(file, header =TRUE, sep = ";", dec = ".")


data<-subset(t,as.Date(Date)=="1/2/2007"|as.Date(Date)=="2/2/2007")
## Plot 4 creation
par(mfrow = c(2, 2))
par(mar = c(4, 4, 1, 1))
# Subplot 1
with(data, plot(strptime(Time,format = "%H:%M:%S"),as.numeric(data$Global_active_power), main = "", xlab = "", ylab = "Global Active Power (kilowatts)", type = "n"))
with(data, lines(strptime(Time,format = "%H:%M:%S"),as.numeric(data$Global_active_power)))
# Subplot 2
with(data, plot(strptime(Time,format = "%H:%M:%S"),as.numeric(data$Voltage), main = "", xlab = "datetime", ylab = "Voltage", type = "n"))
with(data, lines(strptime(Time,format = "%H:%M:%S"),as.numeric(data$Voltage)))
# Subplot 3
with(data, plot(strptime(Time,format = "%H:%M:%S") ,as.numeric(Sub_metering_1), main = "", xlab = "", ylab = "Energy sub metering", type = "n"))
with(data, lines(strptime(Time,format = "%H:%M:%S") ,as.numeric(Sub_metering_1), col = "black"))
with(data, lines(strptime(Time,format = "%H:%M:%S") ,as.numeric(Sub_metering_2), col = "red"))
with(data, lines(strptime(Time,format = "%H:%M:%S") ,as.numeric(Sub_metering_3), col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), 
       lty = 1, box.lty = 0, inset = 0.01)
# Subplot 4
with(data, plot(strptime(Time,format = "%H:%M:%S"),as.numeric(data$Global_reactive_power), main = "", xlab = "datetime", ylab = "Global_reactive_power", type = "n"))
with(data, lines(strptime(Time,format = "%H:%M:%S"),as.numeric(data$Global_reactive_power)))
# PNG export
dev.copy(png, filename = "plot4.png", width = 480, height = 480)
dev.off()