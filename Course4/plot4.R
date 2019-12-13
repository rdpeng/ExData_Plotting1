getwd()
setwd("./Course4")

twoday_power <- read.csv(file = "Feb2DayPower.csv")

DayHour = strptime(paste(twoday_power$Date,twoday_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ActivePower = DayHour_Power$Global_active_power
Voltage = DayHour_Power$Voltage
metering1 <- twoday_power$Sub_metering_1
metering2 <- twoday_power$Sub_metering_2
metering3 <- twoday_power$Sub_metering_3
ReactivePower = DayHour_Power$Global_reactive_power

png(filename = "plot4.png",480,480)
par(mfrow=c(2,2))
plot(DayHour, ActivePower,type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
plot(DayHour, Voltage,type = "l", xlab="", ylab = "Voltage")
plot(DayHour,metering1, type = "l", ylab = "Energy Sub Metering", xlab ="")
  lines(DayHour, metering2, col="red")
  lines(DayHour,metering3,col="blue")  
  legend("topright",
       legend = c("Sub_metering1","Sub_metering2","Sub_metering3"),
       col = c("black","red","blue"),
       lty=1,cex = 0.8)
plot(DayHour, ReactivePower,type = "l", xlab="", ylab = "Global Reactive Power (kilowatts)")
  
dev.off()
