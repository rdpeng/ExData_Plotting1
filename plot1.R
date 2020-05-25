power_consumptn$Global_active_power <- as.numeric(power_consumptn$Global_active_power)
hist(power_consumptn$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()