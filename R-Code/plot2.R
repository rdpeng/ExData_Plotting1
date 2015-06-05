#Graph 2
#Convert Dates
datetime <- paste(as.Date(Data$Date), Data$Time) 
Data$Datetime <- as.POSIXct(datetime)

plot(Data$Global_active_power ~ Data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
