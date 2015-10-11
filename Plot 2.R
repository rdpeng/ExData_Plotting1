## Read from file and download only data within the required period
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert  'Global Active Power' to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)

## Convert Date Time variables to classes
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Plot 2 graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Saving to file 
dev.copy(png, file ="plot2.png", width=480, height=480)
dev.off()
