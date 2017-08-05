activity_url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
temp <- tempfile()
download.file(activity_url, temp)
unzip(temp, "household_power_consumption.txt")

# Subsetting from the whole data
data <- subset(read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE), Date == "1/2/2007" | Date == "2/2/2007")
unlink(temp)

str(data)

# PLOT 4

data$Datetime <- paste(data$Date, data$Time)
data$Datetime <- strptime(data$Datetime, "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,4,2), oma=c(0,0,2,0))
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data$Datetime, data$Voltage,type="l",xlab="datetime", ylab="Voltage")
plot(data$Datetime, data$Sub_metering_1, xlab="",type="l", ylab="Energy sub metering")
lines(data$Datetime, data$Sub_metering_2,col="red")
lines(data$Datetime, data$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Datetime, data$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
