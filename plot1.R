electric <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';')
electric <- subset(electric, (electric$Date == "1/2/2007")|(electric$Date == "2/2/2007"))
electric$Global_active_power <- as.numeric(electric$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(electric$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

