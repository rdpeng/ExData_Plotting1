attach(data)
data$datetime <- as.POSIXct(data$datetime)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
