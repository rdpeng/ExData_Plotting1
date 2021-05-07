full.table <- read.table("C:/Users/Asus/Desktop/Coursera/household_power_consumption.txt", sep = ";", header = TRUE)
full.table1 <- subset(full.table, Date %in% c("1/2/2007", "2/2/2007"))
full.table1$Date <- as.Date(full.table1$Date, format = "%d/%m/%Y")
library(chron)
full.table1$Time <- times(full.table1$Time)
head(full.table1)
class(full.table1$Date)
class(full.table1$Time)

full.table1$Global_active_power <- as.numeric(full.table1$Global_active_power)
full.table1$Global_reactive_power <- as.numeric(full.table1$Global_reactive_power)
full.table1$Voltage <- as.numeric(full.table1$Voltage)
full.table1$Global_intensity <- as.numeric(full.table1$Global_intensity)
full.table1$Sub_metering_1 <- as.numeric(full.table1$Sub_metering_1)
full.table1$Sub_metering_2 <- as.numeric(full.table1$Sub_metering_2)
full.table1$Sub_metering_3 <- as.numeric(full.table1$Sub_metering_3)


full.table1$DateTime = as.POSIXct(paste(full.table1$Date, full.table1$Time))
library(lubridate) 
full.table1$Date <- wday(as.Date(full.table1$Date, '%d-%m-%Y'), label = TRUE)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(full.table1,
{ plot(Global_active_power ~ DateTime, xlab = "", ylab = "Global Active Power", type = "l")
plot(Voltage ~ DateTime, xlab = "datetime", ylab = "Voltage", type ="l")
plot(Sub_metering_1 ~ DateTime, xlab = "", ylab = 'Energy sub metering', type = 'l')
lines(Sub_metering_2 ~ DateTime, col = "red")
lines(Sub_metering_3 ~ DateTime, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n")
plot(Global_reactive_power ~ DateTime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.copy(png, file = "plot4.png")
dev.off()

