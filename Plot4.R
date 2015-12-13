#Plot 4 for Coursea Project
#Data setup
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data$Time <- paste(data$Date, data$Time,sep = " ")


data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

x <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))

#Plot4

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

with(x,   plot(Time, Global_active_power, type="l", xlab="",
               ylab="Global Active Power (kilowatts)"))

plot(x$Time, x$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(x$Time, x$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(x$Time, x$Sub_metering_2, type="l", col="red")
lines(x$Time, x$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(x$Time, x$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()