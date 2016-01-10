## Developed by JC García-Ojeda (2016)
Plot3 <- function(){
  power <- read.csv(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"),sep=";",na.strings = "?")
  power <- subset(power, dmy(Date)>= dmy("01/02/2007") & dmy(Date) <= dmy("02/02/2007"),select = Date:Sub_metering_3)
  #Ploting the histogram in the default device
  Sys.setlocale("LC_TIME","English")
  weekday <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  png("plot3.png", width=480, height=480)
  plot(weekday, as.numeric(power$Sub_metering_1), type="l", col = "black", ylab="Energy sub metering", xlab="")
  lines(weekday, as.numeric(power$Sub_metering_2), type="l", col = "red")
  lines(weekday, as.numeric(power$Sub_metering_3), type="l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = 1, col = c("black","red", "blue"))
  dev.off()
  
  
  
  
  
  
  
  
  
}


