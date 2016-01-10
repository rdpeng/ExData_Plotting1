## Developed by JC García-Ojeda (2016)
Plot4 <- function(){
  power <- read.csv(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"),sep=";",na.strings = "?")
  
  power <- subset(power, dmy(Date)>= dmy("01/02/2007") & dmy(Date) <= dmy("02/02/2007"), select = Date:Sub_metering_3)
  
  #Plotting the histogram in the default device
  Sys.setlocale("LC_TIME","English")
  weekday <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  png("plot4.png", width=480, height=480)
  
  par(mfrow = c(2, 2), mar = c(4, 4,4, 4), oma = c(0, 0, 2, 0))
  weekday <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  #1
  plot(weekday, power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  #2
  plot(weekday, power$Voltage, type="l", xlab="Datetime", ylab="Voltage")
  #3
  plot(weekday, as.numeric(power$Sub_metering_1), type="l", col = "black", ylab="Energy sub metering", xlab="")
  lines(weekday, as.numeric(power$Sub_metering_2), type="l", col = "red")
  lines(weekday, as.numeric(power$Sub_metering_3), type="l", col = "blue")
  legend("topright", inset=0.01, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = 1, col = c("black","red", "blue"), box.lty = 0)
  #4
  plot(weekday, power$Global_reactive_power, type="l", xlab="Datetime", ylab="Global_reactive_power")
  dev.off()
}