if(!file.exists("household_power_consumption.zip")){
  message<-"Please download the household_power_xonsumption.zip from https://archive.ics.uci.edu/ml/machine-learning-databases/00235/ and re-run"
  print(message)
  }
if (file.exists("household_power_consumption.zip")){ 
  filename <- "household_power_consumption.zip"
  unzip(filename)
  data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
  
  data2 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  datetime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  GlobalActivePower <- as.numeric(data2$Global_active_power)
  subMetering1 <- as.numeric(data2$Sub_metering_1)
  subMetering2 <- as.numeric(data2$Sub_metering_2)
  subMetering3 <- as.numeric(data2$Sub_metering_3)
  
  png("plot3.png", width=480, height=480)
  plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
  lines(datetime, subMetering2, type="l", col="red")
  lines(datetime, subMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  dev.off()
  
  }

