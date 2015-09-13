data.main <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")
data <- data.main

data$Time <- paste(data$Date, data$Time, sep = " ")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- as.POSIXct(data$Time, format = "%d/%m/%Y %H:%M:%S")

data.new <- subset(data, Date >= "2007-02-01" & Date < "2007-02-03")

windows(7,7)
par(mfrow=c(2,2))
plot(data.new$Time, as.numeric(data.new$Global_active_power), 
     type = "l", col= "black", xlab = "", ylab= "Global Active Power")
plot(data.new$Time, as.numeric(data.new$Voltage), 
     type = "l", col= "black", xlab = "datetime", ylab= "Voltage", ylim=c(233,247))

plot(data.new$Time, rep(0, length(data.new$Time)), 
     type="n", xlab = "", ylab= "Energy sub metering",  ylim=c(0,38))
lines(data.new$Time, as.numeric(data.new$Sub_metering_1),col= "black")
lines(data.new$Time, as.numeric(data.new$Sub_metering_2),col= "red")
lines(data.new$Time, as.numeric(data.new$Sub_metering_3),col= "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"), bty = "n", lwd=1.5, cex=0.8, y.intersp=1.1, text.font = 2)

plot(data.new$Time, as.numeric(data.new$Global_reactive_power), 
     type = "l", col= "black", xlab = "datetime", ylab= "Global_reactive_power", ylim=c(0,0.5))

dev.copy(png, file= "plot4.png", width = 480, height = 480)
dev.off()
graphics.off()
