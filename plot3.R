source("./exploratoryDataProject1.R")
plot3 <-function(){
  par(mfrow=c(1,1))
  plot(data$DateTime,data$Sub_metering_1,type="l",col="black", ylab="Energy sub metering",xlab ="")
  lines(data$DateTime,data$Sub_metering_2,col="red")
  lines(data$DateTime,data$Sub_metering_3,col="blue")
  legend("topright",lty=1, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
  dev.copy(png,'plot3.png',width=480,height=480)
  dev.off()
}
plot3()
