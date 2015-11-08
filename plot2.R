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

# Plot2
plot(myData$myDateTime, myData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file="plot2.png")
dev.off()
