
## Load the data 
inputData <- prepareData()

# Initialize the png device for plot
png(filename="../plots/plot4.png", width=480, height=480, units="px")

# Plot the four graph in single plot device
# Setting the four plot regions
par(mfrow=c(2,2))

with(
    inputData, {
        ## Top Left plot
        plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
        ## Top Right plot
        plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
        ## Bottom Left plot
        plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, type="l", col="red")
        lines(DateTime, Sub_metering_3, type="l", col="blue")
        legend("topright", lty=1, lwd=1, bty="n", col=c("black","blue","red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
        ## Bottom right plot
        plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
    }
)    

dev.off()
