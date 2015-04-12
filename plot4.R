plot4.par<-par(mfrow=c(2,2),mar=c(4,4,3,3))
plot(pow2$DateTime,pow2$Global_active_power, type="l", ylab = "Global Active Power",xlab="")
plot(pow2$DateTime, pow2$Voltage, type="l", ylab="Voltage", xlab= "datetime")
plot(pow2$DateTime,pow2$Sub_metering_1, type="l", ylim=range, ylab="Energy sub metering",xlab="")
lines(pow2$DateTime,pow2$Sub_metering_2,type="l",col="red")
lines(pow2$DateTime,pow2$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","blue","red"), lty=1, cex=.6)
plot(pow2$DateTime, pow2$Global_reactive_power, type="l", ylab= "Global_reactive_power",xlab="datetime")
par(plot4.par)

dev.copy(png,'plot4.png',width=480,height=480,units="px")
dev.off()
