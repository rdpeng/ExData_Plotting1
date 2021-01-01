png(filename = "plot1.png", width = 480, height = 480)
with(elec_data, hist(Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()