getwd()
setwd("./Course4")

twoday_power <- read.csv(file = "Feb2DayPower.csv")

DayHour = strptime(paste(twoday_power$Date,twoday_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

metering1 <- twoday_power$Sub_metering_1
metering2 <- twoday_power$Sub_metering_2
metering3 <- twoday_power$Sub_metering_3

png("plot3.png", width=480, height=480)

plot(DayHour,metering1, type = "l", ylab = "Energy Sub Metering", xlab ="")
  lines(DayHour, metering2, col="red")
  lines(DayHour,metering3,col="blue")  
  legend("topright",
         legend = c("Sub_metering1","Sub_metering2","Sub_metering3"),
          col = c("black","red","blue"),
          lty=1)
  
  dev.off()
  
