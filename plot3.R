file1 <- read.table("C:/Users/shivam giri/Downloads/household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors=FALSE,na.strings = "?")
sub1<-subset(file1,file1$Date=="1/2/2007"|file1$Date=="2/2/2007")
datetime <- strptime(paste(sub1$Date, sub1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot3<-function(){
  plot(datetime, sub1$Sub_metering_1, type="l", xlab=" ",ylab = "Energy sub metering")
  lines(datetime,sub1$Sub_metering_2,type = "l", col="red")
  lines(datetime,sub1$Sub_metering_3,type = "l", col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 2.5,lty = 1,col=c("black","red","blue"))
  dev.copy(png,file="plot3.png",width=480,height=480)
  dev.off()
}
plot3()
