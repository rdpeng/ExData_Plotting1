datareduction1 <-function (startdate, enddate){
  mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
  mydata1 <- within(mydata, { timestamp=paste(mydata$Date, mydata$Time)})
  date <- as.Date(mydata1$Date, "%d/%m/%Y")
  startdate <- as.Date(startdate, "%Y-%m-%d")
  enddate <- as.Date(enddate,"%Y-%m-%d")
  newdata <- data.frame()
  for(i in 1:length(date)) {
    if (date[i] == startdate){newdata <- rbind(newdata, mydata1[i,])} else if(date[i]==enddate){newdata<- rbind(newdata, mydata1[i,])}}
  head(newdata)
  timedate <- strptime(newdata$timestamp, "%d/%m/%Y %H:%M:%S")
  newdata1 <- within(newdata, {TD = timedate})
  par(mfrow = c(2,2), mar = c(4,4,2,4), cex = 0.5)
  plot(newdata1$TD, newdata1$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(newdata1$TD, newdata1$Global_active_power, type = "l")
  plot(newdata1$TD, newdata1$Voltage, xlab ="datetime", ylab="Voltage",type="n", cex = 0.5)
  lines(newdata1$TD, newdata1$Voltage, type="l")
  plot(newdata1$TD, newdata$Sub_metering_1, type = "n", col ="black", xlab = "", ylab = "Energy sub metering")
  lines(newdata1$TD, newdata1$Sub_metering_1, type = "l")
  lines(newdata1$TD, newdata1$Sub_metering_2, type ="l", col = "red")
  lines(newdata1$TD, newdata1$Sub_metering_3, type ="l", col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"), text.font = 2, cex = 0.64)
  plot(newdata1$TD, newdata1$Global_reactive_power, xlab ="datetime", ylab="Global_reactive_power",type="n", cex = 0.5)
  lines(newdata1$TD, newdata1$Global_reactive_power, type="l")
  dev.copy(png, file="plot4.png", width = 480, height = 480)
  dev.off()
}

