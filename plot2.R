# set working directory
dataFile <- "./Data/household_power_consumption.txt"

# read relevant data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# create a subset of data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# str(subSetData), clear name row and unrelevant variables, casting to right classes
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

# define the output figure
png("plot2.png", width=480, height=480)

# create plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()