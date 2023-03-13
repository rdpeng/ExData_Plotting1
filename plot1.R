#Course Project 1
#loading and getting the data
data_raw <- read.table("household_power_consumption.txt", skip = 1,sep = ";", 
                       na.strings = "?")
names(data_raw) <- c("Date","Time", "Global_active_power", 
                     "Global_reactive_power", "Voltage", "Global_intensity", 
                     "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data_raw <- subset(data_raw, data_raw$Date=="1/2/2007" | data_raw$Date =="2/2/2007")

#plotting(1)
hist(data_raw[, 3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#copy the graphic to the file
dev.copy(png, file = "plot1.png")
dev.off()