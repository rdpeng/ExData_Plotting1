## read data ## 
data <-read.table("F:Course Project1\\household_power_consumption.txt", sep=";", header=TRUE)
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## defined axis ##
datetime <- strptime(paste(subset_data$Date, subset_data$Time), format="%d/%m/%Y %H:%M:%S")
globalActPower <- as.numeric(subset_data$Global_active_power)
globalReactPower <- as.numeric(subset_data$Global_reactive_power)
voltage <- as.numeric(subset_data$Voltage)
subMetering1 <- as.numeric(subset_data$Sub_metering_1)
subMetering2 <- as.numeric(subset_data$Sub_metering_2)
subMetering3 <- as.numeric(subset_data$Sub_metering_3)

## plot the graphic ##
png("F:\\Course Project1\\plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(datetime, globalActPower, pch=1, xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, pch=1, xlab="datetime", ylab="Voltage")

plot(datetime,subMetering1, pch=1, ylab="Energy Submetering", xlab="")
lines(datetime,subMetering2, pch=1, col="red")
lines(datetime,subMetering3, pch=1, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime,globalReactPower, pch=1, ylab="Global_reactive_power", xlab="datetime")

dev.off()
