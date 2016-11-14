infile <- "household_power_consumption.txt"
plots <- read.table(infile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot4 <- plots[plots$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(plot3$Date, plot3$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(plot4$Global_active_power)
GRAP <- as.numeric(plot4$Global_reactive_power)
VOL <- as.numeric(plot4$Voltage)
subMetering1 <- as.numeric(plot4$Sub_metering_1)
subMetering2 <- as.numeric(plot4$Sub_metering_2)
subMetering3 <- as.numeric(plot4$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2))

plot(datetime, GAP, type="l", xlab="",ylab="Global Active Power (kilowatts)")

plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, VOL, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, GRAP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()