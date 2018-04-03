#read.table("household_power_consumption.txt",skip= ,nrows= )
powerData <-read.table("household_power_consumption.txt",nrows= 2880, sep=";", skip=66637)
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
colnames(powerData) <- unlist(header)

powerData[,1] <- as.Date(powerData[,1], format="%d/%m/%Y")

powerData[,2] <- paste(powerData[,1], powerData[,2])
powerData[[2]] <- strptime(powerData[[2]], format="%Y-%m-%d %H:%M:%S")


png('plot4.png')

par(mar=c(2,6,2,2), mfrow=c(2, 2))
#Global Active Power Plot
plot(powerData$Time, powerData$Global_active_power, type='n', xlab = "datetime", ylab = "Global Active Power (kilowatts)")
lines(powerData$Time, powerData$Global_active_power, type="l")

#Voltage to Datetime Plot
plot(powerData$Time, powerData$Voltage, type='n', ylab = "Voltage", xlab="datetime")
lines(powerData$Time, powerData$Voltage, type="l")


#Sub_Meterings Plot
plot(powerData$Time, powerData$Sub_metering_1, type='n', xlab = "",ylab = "Energy sub metering")
legend("topright", bty="n", legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c("black", "red", "blue")
       ,  lty=1, cex=0.7)

lines(powerData$Time, powerData$Sub_metering_1, type="l")
lines(powerData$Time, powerData$Sub_metering_2, col='red', type="l")
lines(powerData$Time, powerData$Sub_metering_3, col='blue', type="l")

#Global_Reactive_Power Plot
plot(powerData$Time, powerData$Global_reactive_power, type='n', xlab = "datetime" ,ylab = "Global_reactive_power")
lines(powerData$Time, powerData$Global_reactive_power, type="l")
#title(xlab="datetime", ylab="Global_reactive_power")

dev.off()
