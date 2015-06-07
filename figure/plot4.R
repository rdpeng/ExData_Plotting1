data <- read.table(file="household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")

data$date_time  <- paste(data$Date,data$Time)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
data$date_time <- strptime(data$date_time, format="%d/%m/%Y %H:%M:%S")

# Subset by date
data <- subset (data, data$Date=="2007-02-01"|data$Date=="2007-02-02")


attach(data)


# Plot4

png("plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))
plot(date_time,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(date_time, Voltage, ylab="Voltage",xlab="datetime", type="l")
plot (date_time,Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines (date_time,Sub_metering_2, type="l", col='red')
lines (date_time,Sub_metering_3, type="l", col='blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c('black','red','blue'), lty=1, cex=0.7, bty="n")
plot(date_time,Global_reactive_power, type="l", xlab="datetime")

dev.off()


