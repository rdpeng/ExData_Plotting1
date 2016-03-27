# set working directory
dataFile <- "./Data/household_power_consumption.txt"

# read the relevant data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# create a subset of data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# str(subSetData), clear name row and unrelevant variables, creating numerics
globalActivePower <- as.numeric(subSetData$Global_active_power)

# define the output figure
png("plot1.png", width=480, height=480)

# create histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()