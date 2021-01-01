png(filename = "plot2.png", width = 480, height = 480)
with(elec_data, plot(Date_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()