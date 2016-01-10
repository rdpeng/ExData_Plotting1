PowerConsData <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";")
headernames <- read.table("household_power_consumption.txt", skip=0, nrows=1, sep=";", stringsAsFactors = FALSE)
colnames(PowerConsData) <- unlist(headernames)
datetime <- strptime(paste(PowerConsData$Date, PowerConsData$Time), "%d/%m/%Y %H:%M:%S")
par(mfcol=c(2,2), mar=c(4,4,1,1))
with(PowerConsData, plot(datetime, Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab=""))
lines(datetime, PowerConsData$Global_active_power, type="l")

with(PowerConsData, plot(datetime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
lines(datetime, PowerConsData$Sub_metering_1, type="l", col="black")
lines(datetime, PowerConsData$Sub_metering_2, type="l", col="red")
lines(datetime, PowerConsData$Sub_metering_3, type="l", col="blue")
legend("topright", legend=headernames[7:9], lty=c(1,1,1), col=c("black", "red", "blue"), cex=0.4)

with(PowerConsData, plot(datetime, Voltage, type="n"))
lines(datetime, PowerConsData$Voltage, type="l")

with(PowerConsData, plot(datetime, Global_reactive_power, type="n"))
lines(datetime, PowerConsData$Global_reactive_power, type="l")

dev.copy(png, file="plot4.png")
dev.off()