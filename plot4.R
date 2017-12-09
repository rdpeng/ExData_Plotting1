data <- read.table("household_power_consumption.txt", sep=";", header = T,
                  stringsAsFactors = FALSE, dec = ".")


data <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

data$Global_active_power<- as.numeric(data$Global_active_power)

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage<- as.numeric(data$Voltage)
data$Global_reactive_power<- as.numeric(data$Global_reactive_power)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1))

with(data,{
  plot(datetime,data$Global_active_power, type = "l", ylab = "Global Active Power")
  plot(datetime,data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering")
  lines(datetime,data$Sub_metering_2,col='Red')
  lines(datetime,data$Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd = 2)
  plot(datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Energy sub metering")
  
})

dev.off()