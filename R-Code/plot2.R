#Graph 2
#Convert Dates
datetime <- paste(as.Date(Data$Date), Data$Time) 
Data$Datetime <- as.POSIXct(datetime)

plot(Data$Global_active_power ~ Data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Saves data to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
