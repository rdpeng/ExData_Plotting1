#Course Project 1
#loading and getting the data
data_raw <- read.table("household_power_consumption.txt", skip = 1,sep = ";", 
                       na.strings = "?")
names(data_raw) <- c("Date","Time", "Global_active_power", 
                     "Global_reactive_power", "Voltage", "Global_intensity", 
                     "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data_raw <- subset(data_raw, data_raw$Date=="1/2/2007" | data_raw$Date =="2/2/2007")

#change format of time data
Sys.setlocale("LC_TIME", "English")
date_format <- as.Date(data_raw$Date, format = "%d/%m/%Y")
time_format <- strptime(data_raw$Time, format = "%H:%M:%S")
time_final <- as.POSIXct(paste(date_format, data_raw$Time))


#plotting(4)
par(mfrow = c(2,2))
plot(time_final, data_raw$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", 
     type = "l")
plot(time_final, data_raw$Voltage, xlab = "datetime", ylab = "Voltage", 
     type = "l")
plot(time_final, data_raw$Sub_metering_1, xlab = "", 
     ylab = "Energy sub metering", type = "l")
lines(time_final, data_raw$Sub_metering_2, col = "red")
lines(time_final, data_raw$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), cex = 0.8, lty = 1 , bty = "n")
plot(time_final, data_raw$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type = "l")

#copy the graphic to the file
dev.copy(png, file = "plot4.png")
dev.off()