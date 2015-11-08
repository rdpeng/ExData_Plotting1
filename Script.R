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

# Getting day information
myData["myDay"] <- NA
myData$myDay <- format(myData$myDateTime, "%a")

# Adjusting margins for pretty plotting
par(mar= c(4,5,2,1))

# strptime("01/02/2007", "%d/%m/%Y")
# strptime("00:03:00", "%T")
# as.Date("01/02/2007", "%d/%m/%Y")
# format(as.Date("1/2/2007 00:03:00", "%d/%m/%Y %T"), "%a %b %d %X %Y %Z")
# format(as.Date("1/2/2007", "%d/%m/%Y"), "%a %b %d %X %Y %Z")
# as.Date.factor(myData$Date, format("%d/%m/%Y"))
# strptime(as.character.factor(myData$Time), format = ("%H:%M:%S"))
# paste(myData$Date, myData$Time, sep = " ")
# myDateTime <- paste(myData$Date, myData$Time, sep = " ")
# myDateTime <- strptime(paste(myData$Date, myData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
# myData["myDateTime"] <- myDateTime
# # myData$myDateTime <- NULL
# > myDateTime[1]
# [1] "1/2/2007 00:00:00"
# > t1 <- myDateTime[1]
# > t1 <- myDateTime[10]
# > t1
# [1] "1/2/2007 00:09:00"
# > t2 <- strptime(t1, format = "%d/%m/%Y %H:%M:%S")

# Plot1
hist(myData$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()

# Plot2
plot(myData$myDateTime, myData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file="plot2.png")
dev.off()

# Plot3
plot(myData$myDateTime, myData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(myData$myDateTime, myData$Sub_metering_2, col = "red")
lines(myData$myDateTime, myData$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7, xjust = 1)
dev.copy(png, file="plot3.png")
dev.off()

# Plot4
par(mfrow=c(2,2), mar= c(5,5,2,1))
with(myData, {
    plot(myDateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", cex.lab = 0.7)
    plot(myDateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime", cex.lab = 0.7)
    plot(myDateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", cex.lab = 0.7)
	lines(myDateTime, Sub_metering_2, col = "red")
	lines(myDateTime, Sub_metering_3, col = "blue")
	legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), xpd = 1, seg.len= 1, cex=0.4, xjust = 1, bty = "n")
	plot(myDateTime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", cex.lab = 0.7)
})
dev.copy(png, file="plot4.png")
dev.off()
