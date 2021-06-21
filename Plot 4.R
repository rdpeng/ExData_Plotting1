Alldata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Alldata$Date2<-as.Date(Alldata$Date, format = "%d/%m/%Y")
data2<-subset(Alldata, Date2 == as.Date("2007-02-01") | Date2 == as.Date("2007-02-02"))
data2$time2<- strptime(paste(data2$Date, data2$Time), format = "%d/%m/%Y %H:%M:%S")

#plot 4
png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))
plot(y=as.numeric(data2$Global_active_power), x=data2$time2, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")

plot(y=as.numeric(data2$Voltage), x=data2$time2, type = "l", ylab = "Voltage", xlab = "datetime")

plot(y=as.numeric(data2$Sub_metering_1), x=data2$time2, col="black", type="l", ylab = "Energy sub metering", xlab = "")
lines(y=as.numeric(data2$Sub_metering_2), x=data2$time2, col = "red", type = "l")
lines(y=as.numeric(data2$Sub_metering_3), x=data2$time2, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1:1:1)

plot(y=as.numeric(data2$Global_reactive_power), x=data2$time2, type = "l", ylab = "global_reactive_power", xlab = "datetime")
dev.off()
