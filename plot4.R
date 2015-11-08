# Loading the data
myFile <- "household_power_consumption.txt"
header <- read.table(myFile, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE);
day1Lines <- grep("^1/2/2007", readLines(myFile))
day2Lines <- grep("^2/2/2007", readLines(myFile))
toBeReadLines <- c(day1Lines, day2Lines)
myData <- read.table(myFile, header = FALSE, skip=(day1Lines[1]-1), nrows = length(toBeReadLines), sep = ";")
colnames( myData ) <- unlist(header)

# Converting to POSIXlt
myData["myDateTime"] <- NA
myData$myDateTime <- strptime(paste(myData$Date, myData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Plot4
par(mfrow=c(2,2), mar= c(5,5,2,1))
with(myData, {
    plot(myDateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", cex.lab = 0.7)
    plot(myDateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime", cex.lab = 0.7)
    plot(myDateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", cex.lab = 0.7)
	lines(myDateTime, Sub_metering_2, col = "red")
	lines(myDateTime, Sub_metering_3, col = "blue")
	legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), xpd = 1, y.intersp=0.5, seg.len= 1, cex=0.4, xjust = 1, bty = "n")
	plot(myDateTime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", cex.lab = 0.7)
})
dev.copy(png, file="plot4.png")
dev.off()