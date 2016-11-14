infile <- "household_power_consumption.txt"
plots <- read.table(infile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot3 <- plots[plots$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(plot3$Date, plot3$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(plot3$Global_active_power)
subMetering1 <- as.numeric(plot3$Sub_metering_1)
subMetering2 <- as.numeric(plot3$Sub_metering_2)
subMetering3 <- as.numeric(plot3$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()