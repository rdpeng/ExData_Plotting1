# Plot 4

# Loading the Datafile
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- data[data$Date %in% C("1/2/2007", "2/2/2007"),]

# Preparing the Data
dateTime <- strptime(paste(subSet$Date, subSet$Time, sep =" "), "%d/%m/%Y %H:%M:%S")
globActPow <- as.numeric(subSet$Global_active_power)
globReactPow <- as.numeric(subSet$Global_reactive_power)
voltage <- as.numeric(subSet$Voltage)

sub_1 <- as.numeric(subSet$Sub_metering_1)
sub_2 <- as.numeric(subSet$Sub_metering_2)
sub_3 <- as.numeric(subSet$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

# Plot 1
plot(dateTime, globActPow, type = "l", ylab="Global Active Power", xlab="")

# Plot 2
plot(dateTime, voltage, type = "l", ylab = "Voltage", xlab="datetime")

#Plot 3
plot(dateTime, sub_1, type = "l", ylab="Energy sub metering", xlab="")
lines(dateTime, sub_2, col="red", type="l")
lines(dateTime, sub_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n",lty=, lwd=2.5, col= c("black","red","blue"))

#Plot 4
plot(dateTime, globReactPow,type="l", ylab="Global_reactive_poswer", xlab="datetime")

dev.off()