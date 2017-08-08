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



###Plot4
par(mfrow = c(2,2), mar = c(4, 4, 2, 1))
plot(newww$newtime ,newww$Global_active_power, xlab = "", ylab ="Global Active Power",cex.axis = 0.5, type = "l", xaxt="n",  cex.lab = 0.6)

plot(newww$newtime ,newww$Voltage, xlab = "datetime", ylab ="Voltage",cex.axis = 0.5, type = "l", cex.lab = 0.6)

with(newww, plot(newtime, Sub_metering_1, type = "l", xlab = "datetime", ylab = "Energy Sub Metering", ylim = range(c(Sub_metering_1, Sub_metering_2, Sub_metering_3)),cex.axis = 0.5, cex.lab = 0.6))

par(new = T)

with(newww, plot(newtime, Sub_metering_2, type = "l",col = "red" ,ylim = range(c(Sub_metering_1, Sub_metering_2, Sub_metering_3)), xlab = "", ylab = "", cex.axis = 0.5))

par(new = T)

with(newww, plot(newtime, Sub_metering_3, type = "l",col = "blue" ,ylim = range(c(Sub_metering_1, Sub_metering_2, Sub_metering_3)), xlab = "", ylab = "",cex.axis = 0.5))

legend("topright", 30, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), xpd = TRUE, col = c("black", "red", "blue"), lty = c(1,1,1), box.lwd=c(1,1,1), cex = 0.2, x.intersp = 0.4, y.intersp = 0.4)
plot(newww$newtime ,newww$Global_reactive_power, xlab = "datetime", ylab ="Global_reactive_power", type = "l", cex.lab = 0.6, cex.axis = 0.5)
dev.copy(png,'plot4.png', height = 480, width = 480)
dev.off()











