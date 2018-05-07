data <- read.table('household_power_consumption.txt', sep = ';', header = T, stringsAsFactors=FALSE)
starttime <- as.Date('2007-02-01')
stoptime <- as.Date('2007-02-02')
data <- data[as.Date(strptime(data$Date, format = '%d/%m/%Y')) >= starttime, ]
data <- data[stoptime >= as.Date(strptime(data$Date, format = '%d/%m/%Y')), ]
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submeter1 <- as.numeric(data$Sub_metering_1)
submeter2 <- as.numeric(data$Sub_metering_2)
submeter3 <- as.numeric(data$Sub_metering_3)
png("plot3.png", width=480, height=480, units = "px")
plot(datetime, submeter1,type = "l", xlab = "", ylab = "Energy sub metering")
points(datetime, submeter2, type = "l", col="red")
points(datetime, submeter3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()

