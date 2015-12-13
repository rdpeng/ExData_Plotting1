#Plot 4 for Coursea Project

#Data setup
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data$Time <- paste(data$Date, data$Time,sep = " ")


data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

dataUse <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))
#plot 4
png("plot4.png", width = 480, height = 480)

par(mfrow=c(2, 2))
plot(dataUse$Time, dataUse$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(dataUse$Time, dataUse$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dataUse$Time, dataUse$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines (dataUse$Time, dataUse$Sub_metering_2, col = "red")
lines (dataUse$Time, dataUse$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_1","Sub_metering_1"),col = c("black","red","blue"),lty = c(1,1,1))
plot(dataUse$Time, dataUse$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()