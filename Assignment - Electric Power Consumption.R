#Plot 1
powerData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?","NA"))
head(powerData)

febData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007"), ]
head(febData)
summary(febData)
summary(febData$Global_active_power)
glpower <- febData$Global_active_power
hist(glpower, breaks=12,col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#Plot 2
plot(Global_active_power ~ Time , data=febData)
febData$DateTime <- strptime(paste(febData$Date, ' ', febData$Time), format="%d/%m/%Y %H:%M:%S")
head(febData)
class(febData$DateTime)
febData$DateTime
plot(febData$DateTime, febData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Plot 3
plot(febData$DateTime, febData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(febData$DateTime, febData$Sub_metering_2, col="red", type="l", ylab="Energy sub metering", xlab="")
points(febData$DateTime, febData$Sub_metering_3, col="blue", type="l", ylab="Energy sub metering", xlab="")
legend("topright", pch = c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot 4
par(mfrow=c(2,2))
plot(febData$DateTime, febData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(febData$DateTime, febData$Voltage, ylab="Global reactive power", xlab="datetime", type="l")
plot(febData$DateTime, febData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(febData$DateTime, febData$Sub_metering_2, col="red", type="l", ylab="Energy sub metering", xlab="")
points(febData$DateTime, febData$Sub_metering_3, col="blue", type="l", ylab="Energy sub metering", xlab="")
legend("topright", pch = c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(febData$DateTime, febData$Voltage, ylab="Global reactive power", xlab="datetime", type="l")
