rm(list=ls())
dataFile <- "C:\\Users\\UdyotKumar\\Desktop\\Resume\\exploring data\\household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
plot(datetime, subSetData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime,subSetData$Voltage , type="l", xlab="datetime", ylab="voltage")
plot(datetime,subSetData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime,subSetData$Sub_metering_2, col="red")
lines(datetime,subSetData$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime,subSetData$Global_reactive_power , type="l", xlab="datetime", ylab="Global_reactive_power")
