source("prepareData.R")

## Load the data 
inputData <- prepareData()

# Initialize the png device for plot
png(filename="../plots/plot3.png", width=480, height=480, units="px")

# now plot the asked graph to show energy submetring vs day-wise
plot(inputData$DateTime, inputData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(inputData$DateTime, inputData$Sub_metering_2, type="l", col="red")
lines(inputData$DateTime, inputData$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Off the device
dev.off()
