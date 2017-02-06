source("main.R")

# Plot 4 -----------------------------------

par(mfrow=c(1,1))

# [1,1]
with(data, plot(Time, Global_active_power, 
                type="l",
                xlab="", ylab="Global Active Power", 
                cex.lab=0.8, cex.axis=0.9))

# [1,2]
with(data, plot(Time, Voltage, 
                type="l",
                xlab="", ylab="Voltage", 
                cex.lab=0.8, cex.axis=0.9))

# [2,1]
plot(data$Time, data$Sub_metering_1, 
     type="l", ylab="Energy sub metering", xlab="", cex.lab=0.8, cex.axis=0.9)
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"), cex=0.7, bty="n")

# [2,2]
with(data, plot(Time, data$Global_reactive_power, 
                type="l",lwd=0.5,
                xlab="datetime", ylab="Global_reactive_power", 
                cex.lab=0.8, cex.axis=0.9))

# create a file plot4.png and save the output in this file
dev.copy(png, file = "plot4.png",  width = 480, height = 480)
dev.off()

