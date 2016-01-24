range <- range(0, pow2$Sub_metering_1, pow2$Sub_metering_2, pow2$Sub_metering_3)
plot(pow2$DateTime,pow2$Sub_metering_1, type="l", ylim=range, ylab="Energy sub metering",xlab="")
lines(pow2$DateTime,pow2$Sub_metering_2,type="l",col="red")
lines(pow2$DateTime,pow2$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","blue","red"), lty=1, cex=.7)

dev.copy(png,'plot3.png',width=480,height=480,units="px")
dev.off()
