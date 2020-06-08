## read data
power <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")

## Create column in table with date and time merged together
Full <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power <- cbind(powerdata, Full)

## change class of all columns to correct class
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- format(power$Time, format="%H:%M:%S")
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Voltage <- as.numeric(power$Voltage)
power$Global_intensity <- as.numeric(power$Global_intensity)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

## subset data from 2007-02-01 and 2007-02-02
subsetdata <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")

## plot the 4 graphs
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(subsetdata, plot(Full, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(subsetdata, plot(Full, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
with(subsetdata, plot(Full, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(subsetdata$Full, subsetdata$Sub_metering_2,type="l", col= "red")
lines(subsetdata$Full, subsetdata$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(subsetdata, plot(Full, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()