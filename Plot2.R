## Developed by JC García-Ojeda (2016)
Plot2 <- function(){
  power <- read.csv(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"),sep=";",na.strings = "?")
  
  power <- subset(power, dmy(Date)>= dmy("01/02/2007") & dmy(Date) <= dmy("02/02/2007"),select = Date:Sub_metering_3)
  
  #Ploting the histogram in the file device "Plot2.png" 
  
  Sys.setlocale("LC_TIME","English")
  weekday <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  png("plot2.png", width=480, height=480)
  plot(weekday, power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
  
  
  
  
  
  
  
}


