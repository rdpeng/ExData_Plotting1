
data3$Date <- as.Date(data3$Date, format="%d/%m/%Y")

data3$datetime = strptime(paste(data3$Date, data3$Time), format="%Y-%m-%d %H:%M:%S")


plot(data3$datetime, data3$Global_active_power,
     ylab= "Global Active Power (kilowatts)", type='l', xlab="") 

dev.copy(png,'plot2.png',  width = 480, height = 480)
dev.off()
