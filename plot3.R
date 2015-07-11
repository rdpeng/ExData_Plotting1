###make table using household file
powerF<-read.csv("household_power_consumption.txt",sep=";",header=T,na.strings="?")
power<-powerF[which(powerF$Date=="1/2/2007"|powerF$Date=="2/2/2007"),]
power$time2<-strptime(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")

### plot 3.
png("plot3.png",width=480,height=480)
plot(x=power$time2,y=power$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(x=power$time2,y=power$Sub_metering_2,col="Red")
lines(x=power$time2,y=power$Sub_metering_3,col="Blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2,2,2),col=c("black","red","blue"))
dev.off()
