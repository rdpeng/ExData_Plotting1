data<-read.table("household_power_consumption.txt" ,sep=";",header = T,colClasses = "character")
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

with(data,{
plot(Sub_metering_1,type="n")
lines(Sub_metering_1,type="l")
lines(Sub_metering_2,type="l",col="red")
lines(Sub_metering_3,type="l",col="blue"
     ,ylab = "Energy sub metering"
     ,xlab =" ")
legend("topright",lty=1,col=c("black","red","blue")
       ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})
dev.copy(png,file="plot3.png")
dev.off()
