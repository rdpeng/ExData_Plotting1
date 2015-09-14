# reading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
library(dplyr)
data2 <- filter(data, Date=="1/2/2007" | Date=="2/2/2007")

# set up the time
data2$time <- paste(data2$Date, data2$Time, sep=" ")
data2$clock <- strptime(data2$time, "%d/%m/%Y %H:%M:%S")

# creating a plot
plot(x = data2$clock, y = data2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# saving plot to PNG file
png(filename = "plot2.png", height = 480, width = 480, units = "px")
plot(x = data2$clock, y = data2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
