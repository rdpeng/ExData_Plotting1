source("prepareData.R")

## Load the data 
inputData <- prepareData()

# Initialize the png device for plot
png(filename="../plots/plot2.png", width=480, height=480, units="px")

# now plot the asked graph to show day-wise Global active power 
plot(inputData$DateTime, inputData$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

# Off the device
dev.off()
