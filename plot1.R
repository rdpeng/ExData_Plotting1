# loading data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
library(dplyr)
data2 <- filter(data, Date=="1/2/2007" | Date=="2/2/2007")

# creating a plot
hist(data2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200))

# saving plot to PNG file
png(filename = "plot1.png", height = 480, width = 480, units = "px")
hist(data2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200))
dev.off()
