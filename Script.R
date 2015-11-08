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

#Plot2
plot(myData$myDateTime, myData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file="plot2.png")
dev.off()
