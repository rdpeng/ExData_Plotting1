# Loading the data
myFile <- "household_power_consumption.txt"
header <- read.table(myFile, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE);
day1Lines <- grep("^1/2/2007", readLines(myFile))
day2Lines <- grep("^2/2/2007", readLines(myFile))
toBeReadLines <- c(day1Lines, day2Lines)
myData <- read.table(myFile, header = FALSE, skip=(day1Lines[1]-1), nrows = length(toBeReadLines), sep = ";")
colnames( myData ) <- unlist(header)

# Plot1
hist(myData$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()

#Plot2
strptime("01/02/2007", "%d/%m/%Y")
strptime("00:03:00", "%T")
as.Date("01/02/2007", "%d/%m/%Y")
format(as.Date("1/2/2007 00:03:00", "%d/%m/%Y %T"), "%a %b %d %X %Y %Z")

format(as.Date("1/2/2007", "%d/%m/%Y"), "%a %b %d %X %Y %Z")