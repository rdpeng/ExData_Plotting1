Alldata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Alldata$Date2<-as.Date(Alldata$Date, format = "%d/%m/%Y")
data2<-subset(Alldata, Date2 == as.Date("2007-02-01") | Date2 == as.Date("2007-02-02"))
data2$time2<- strptime(paste(data2$Date, data2$Time), format = "%d/%m/%Y %H:%M:%S")

#plot3
png("plot3.png", width=480, height=480)
plot(y=as.numeric(data2$Sub_metering_1), x=data2$time2, col="black", type="l", ylab = "Energy sub metering", xlab = "")
lines(y=as.numeric(data2$Sub_metering_2), x=data2$time2, col = "red", type = "l")
lines(y=as.numeric(data2$Sub_metering_3), x=data2$time2, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1:1:1)
dev.off()
