source("./exploratoryDataProject1.R")
plot4<-function(){
  par(mfrow=c(2,2))
  plot(data$DateTime,data$Global_active_power,main = "Global Active Power", ylab = "Global Active power",xlab ="",type="l") 
  plot(data$DateTime,data$Voltage,main = "Voltage", ylab = "Voltage",xlab ="Date Time",type="l")
  plot(data$DateTime,data$Sub_metering_1,type="l",col="black", ylab="Energy sub metering",xlab ="")
  lines(data$DateTime,data$Sub_metering_2,col="red")
  lines(data$DateTime,data$Sub_metering_3,col="blue")
  legend("topright",lty=1, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n",cex=0.5)
  plot(data$DateTime,data$Global_reactive_power,main = "Global Reactive Power", ylab = "Global Reactive power",xlab ="Date Time",type="l") 
  dev.copy(png,'plot4.png',width=480,height=480)
  dev.off()
}
plot4()
