#graph 3
with(subData, {
    dateTime<-strptime(paste(Date,Time,sep=" "), "%d/%m/%Y %H:%M:%S")
    dateTime<-as.POSIXct(dateTime)
    subMeter1<-as.numeric(Sub_metering_1)
    subMeter2<-as.numeric(Sub_metering_2)
    subMeter3<-as.numeric(Sub_metering_3)
    png("plot3.png",width=480,height=480)
    plot(dateTime,subMeter1,type="l",ylab="Energy Submetering",xlab="")
    lines(dateTime,subMeter2,type="l",col="red")
    lines(dateTime,subMeter3,type="l",col="blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))
    dev.off()
})
