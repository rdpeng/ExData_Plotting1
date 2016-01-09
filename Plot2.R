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
  png("plot2.png", width=480, height=480)
  plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
  
  }

