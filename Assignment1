Dataset <-  read.table("/Users/rickysemwal/Documents/Exploratory data Analysis/household_power_consumption 2.txt",header = TRUE, sep = ";")
Dataset2 <- Dataset[Dataset$Date=="1/2/2007"|Dataset$Date=="2/2/2007" ,]
png("plot1.png", width = 480, height = 480)
par(mar=c(8,8,4,4))
hist(as.numeric(Dataset2$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

png("plot2.png", width=480, height=480)
par(mar = c(6,6,4,4))
datetime <- strptime(paste(Dataset2$Date, Dataset2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, as.numeric(Dataset2$Global_active_power), main = "Global active Power", xlab = " ", ylab = "Global active Power", type = "l")
dev.off()

png("plot3.png", width=480, height=480)
plot(datetime, as.numeric(Dataset2$Sub_metering_1)/5, type = "l", ylab = "Energy sub metering", xlab = " ")
lines(datetime, as.numeric(Dataset2$Sub_metering_2)/5, type="l", col="red")
lines(datetime, as.numeric(Dataset2$Sub_metering_3)/5, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, as.numeric(Dataset2$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, as.numeric(Dataset2$Voltage), type="l", xlab="datetime", ylab="Voltage")

plot(datetime, as.numeric(Dataset2$Sub_metering_1)/5, type = "l", ylab = "Energy sub metering", xlab = " ")
lines(datetime, as.numeric(Dataset2$Sub_metering_2)/5, type="l", col="red")
lines(datetime, as.numeric(Dataset2$Sub_metering_3)/5, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, as.numeric(Dataset2$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
