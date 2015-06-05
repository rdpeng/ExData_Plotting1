#Graph 1
hist(Data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Saves data to file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
