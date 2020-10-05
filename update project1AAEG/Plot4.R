#Plot4

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(x=DateTime,y=power1$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(x=DateTime,y=power1$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(x=DateTime,y=power1$Sub_metering_1,xlab="",type="l",ylab="Energy sub metering")
lines(x=DateTime,y=power1$Sub_metering_2,col="red")
lines(x=DateTime,y=power1$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(x=DateTime,y=power1$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()