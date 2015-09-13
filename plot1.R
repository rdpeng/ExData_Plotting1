# Homework Assignment Exploratory Data Analyis - Week 1 

# Plot 1

# Loading Data
dataFile <- "./data/household_power_consumption.txt"
dataSet <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- dataSet[dataSet$Date %in% c("1/2/2007", "2/2/2007")]
dateTime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Drawing the plot
png("plot1.png", height=480, width=480)
globActPow <- as.numeric(subSet$Global_active_power)
hist(globActPow, col="red",main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")
dev.off()

# I have made a change to this to test GIT