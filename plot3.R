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

# Adjusting margins for pretty plotting, assuring 1x1 plot.
par(mfrow=c(1,1), mar= c(5,5,2,1))

# Plot3
plot(myData$myDateTime, myData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(myData$myDateTime, myData$Sub_metering_2, col = "red")
lines(myData$myDateTime, myData$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7, y.intersp=0.5, pt.lwd =0.5, xjust = 1)
dev.copy(png, file="plot3.png")
dev.off()