activity_url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
temp <- tempfile()
download.file(activity_url, temp)
unzip(temp, "household_power_consumption.txt")

# Subsetting from the whole data
data <- subset(read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE), Date == "1/2/2007" | Date == "2/2/2007")
unlink(temp)

# PLOT 3

data$Datetime <- paste(data$Date, data$Time)
data$Datetime <- strptime(data$Datetime, "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$Datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()