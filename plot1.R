##Load Data
xxx = read.table(file = "household_power_consumption.txt", sep = ";", header = T)
library(lubridate)   #install the package if you have not got it on your computer

##convert time and Date, Data class
xxx$Date = dmy(xxx$Date)
xxx$Time = as.character(xxx$Time)
xxx$newtime = paste(xxx$Date, xxx$Time)
xxx$newtime = ymd_hms(xxx$newtime)

newww = xxx[xxx$Date == "2007-02-01" | xxx$Date == "2007-02-02",]

newww$Global_active_power = as.numeric(as.character(newww$Global_active_power))
newww$Global_reactive_power = as.numeric(as.character(newww$Global_reactive_power))
newww$Voltage = as.numeric(as.character(newww$Voltage))
newww$Sub_metering_1 = as.numeric(as.character(newww$Sub_metering_1))
newww$Sub_metering_2 = as.numeric(as.character(newww$Sub_metering_2))
newww$Sub_metering_3 = as.numeric(as.character(newww$Sub_metering_3))


###Plot1
par(mfrow=c(1,1), mar = c(5, 4, 4, 2) + 0.1)
hist(newww$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.copy(png,'plot1.png', height = 480, width = 480)
dev.off()
#dev.cur()
