data<-read.table("household_power_consumption.txt" ,sep=";",header = T,colClasses = "character")
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Voltage<-as.numeric(data$Voltage)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

par(mfrow=c(2,2))
#top left
{plot(data$Global_active_power,main="",type = "l"
     ,ylab = "Global Active Power (kilowatts)"
     ,xlab=NULL)}
#top right
plot(data$Voltage,type="l",xlab = "detetime",ylab = "Voltage")
#bottom left
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
#bo ri
plot(data$Global_reactive_power,type="l"
     ,ylab = "Global_active_power",xlab = "detetime")
dev.copy(png,file="plot4.png")
dev.off()
