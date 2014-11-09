#build plot 4 and save as png file
png(file="plot4.png",width=480,height=480)
#set 2*2 graph
par(mfrow=c(2,2))
#add the first graph
plot(newdate,power2$Global_active_power,type="l",ylab="Global Active Power",xlab="")
#add the second one
plot(newdate,power2$Voltage,type="l",xlab="datetime",ylab="Voltage")
#add the third one
plot(newdate,power2$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(newdate,power2$Sub_metering_2,type="l",col="red")
points(newdate,power2$Sub_metering_3,type="l",col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=0.8,x.intersp=1,bty="n",xpd=F)
#add the forth one
plot(newdate,power2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
