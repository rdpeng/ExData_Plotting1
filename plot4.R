data <- read.table('household_power_consumption.txt', sep = ';', header = T, stringsAsFactors=FALSE)
starttime <- as.Date('2007-02-01')
stoptime <- as.Date('2007-02-02')
data <- data[as.Date(strptime(data$Date, format = '%d/%m/%Y')) >= starttime, ]
data <- data[stoptime >= as.Date(strptime(data$Date, format = '%d/%m/%Y')), ]

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Global_active_power <- as.numeric(data$Global_active_power)
Global_reactive_power <- as.numeric(data$Global_reactive_power)
Voltage <- as.numeric(data$Voltage)
submeter1 <- as.numeric(data$Sub_metering_1)
submeter2 <- as.numeric(data$Sub_metering_2)
submeter3 <- as.numeric(data$Sub_metering_3)



png("plot4.png", width=480, height=480, units = "px")
par(mfrow=c(2,2))

plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


