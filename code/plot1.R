source("prepareData.R")

## Load the data 
inputData <- prepareData()

# Initialize the png device for plot
png(filename="../plots/plot1.png", width=480, height=480, units="px")

# now plot the asked histogram to show the frequency of global active power
hist(inputData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()
