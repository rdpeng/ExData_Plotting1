data.main <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")
data <- data.main

data$Time <- paste(data$Date, data$Time, sep = " ")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- as.POSIXct(data$Time, format = "%d/%m/%Y %H:%M:%S")

data.new <- subset(data, Date >= "2007-02-01" & Date < "2007-02-03")

windows(6,6)

par(mfrow=c(1,1))
plot(data.new$Time, as.numeric(data.new$Sub_metering_2), 
     type = "l", col= "red", xlab = "", ylab= "", ylim=c(0,38))
par(new=TRUE)
plot(data.new$Time, as.numeric(data.new$Sub_metering_3), 
     type = "l", col= "blue", xlab = "", ylab= "", ylim=c(0,38))
par(new=TRUE)
plot(data.new$Time, as.numeric(data.new$Sub_metering_1), 
     type = "l", col= "black", xlab = "", ylab= "Energy sub metering", ylim=c(0,38))

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"), bty = "l", lwd=1.75, cex=0.85, y.intersp=0.9)

dev.copy(png, file= "plot3.png", width = 480, height = 480)
dev.off()
graphics.off()
