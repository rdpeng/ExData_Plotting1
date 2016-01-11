library(datasets)
alldata <- "./data/household_power_consumption.txt"
data <- read.table(alldata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerconsump2daysdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


date_time <- strptime(paste(powerconsump2daysdata$Date, powerconsump2daysdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global_actpower <- as.numeric(powerconsump2daysdata$Global_active_power)
subMetering1 <- as.numeric(powerconsump2daysdata$Sub_metering_1)
subMetering2 <- as.numeric(powerconsump2daysdata$Sub_metering_2)
subMetering3 <- as.numeric(powerconsump2daysdata$Sub_metering_3)
voltage <- as.numeric(powerconsump2daysdata$Voltage)
global_reactpower <- as.numeric(powerconsump2daysdata$Global_reactive_power)

png("plot4.png", width=480, height=480)

par(mfcol=c(2,2))

# Graph 1
  plot(date_time, global_actpower, type="l", xlab=" ", ylab="Global Active Power (kilowatts)" )
# Graph 2
  plot(date_time, subMetering1, type="l" , xlab=" ", ylab="Energy sub metering", col="black")
  lines(date_time, subMetering2, type="l", col="red")
  lines(date_time, subMetering3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2)
# Graph 3
  plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")
# Graph 4
  plot(date_time, global_reactpower, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()
