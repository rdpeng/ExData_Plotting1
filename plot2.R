plot(power_consumptn$Global_active_power ~ power_consumptn$date_Time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()