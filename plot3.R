# reading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
library(dplyr)
data2 <- filter(data, Date=="1/2/2007" | Date=="2/2/2007")

# set up the time
data2$time <- paste(data2$Date, data2$Time, sep=" ")
data2$clock <- strptime(data2$time, "%d/%m/%Y %H:%M:%S")

# creating a plot
plot(x = data2$clock, y = data2$Sub_metering_1, type = "l", xlab= "", ylab="Energy sub metering")
lines(x = data2$clock, y = data2$Sub_metering_2, type = "l", col = "red")
lines(x = data2$clock, y = data2$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))

# saving plot to PNG file
png(filename = "plot3.png", height = 480, width = 480, units = "px")
plot(x = data2$clock, y = data2$Sub_metering_1, type = "l", xlab= "", ylab="Energy sub metering")
lines(x = data2$clock, y = data2$Sub_metering_2, type = "l", col = "red")
lines(x = data2$clock, y = data2$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
dev.off()
