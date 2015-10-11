## Read from file and download only data within the required period

dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Plot 1 histogram
## Convert  'Global Active Power' to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
hist(globalActivePower, main="Global Active Power",  
      xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 
 
## Saving to file 
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
