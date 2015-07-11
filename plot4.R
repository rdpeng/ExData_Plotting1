###make table using household file 
powerF<-read.csv("household_power_consumption.txt",sep=";",header=T,na.strings="?")
power<-powerF[which(powerF$Date=="1/2/2007"|powerF$Date=="2/2/2007"),]
power$time2<-strptime(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")

### plot 4.
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(power$time2,power$Global_active_power,xlab="",ylab="Global Active Power",type="l")
plot(power$time2,power$Voltage,xlab="datetime",ylab="Voltage",type="l")
plot(x=power$time2,y=power$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(x=power$time2,y=power$Sub_metering_2,col="red")
lines(x=power$time2,y=power$Sub_metering_3,col="blue")
legend('topright',bty="n",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75,lty=c(1,1,1),lwd=c(2,2,2),col=c("black","red","blue"))
plot(power$time2,power$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type='l')
dev.off()
