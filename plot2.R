## plot2
png("plot2.png", width = 480, height = 480, units = "px")
with(plotdata, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" ))
## dev.copy(png, file = "plot2.png")
dev.off()
