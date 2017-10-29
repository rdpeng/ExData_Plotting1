#Exploratory Data Analysis Project 1

#Plot4
#The data file is assumed to be sitting in a local C directory
setwd("C:/")

mydata = read.table("household_power_consumption.txt", header=TRUE, sep = ";",na.strings = "?")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- subset(mydata, (Date >= "2007-02-01" & Date <= "2007-02-02")) 

mydata$datetime <- strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S") 

par(mfrow = c(2, 2)) 
plot(mydata$datetime, mydata$Global_active_power, type="l",ylab = "Global Active Power", xlab = "")
plot(mydata$datetime, mydata$Voltage, type="l",ylab = "Voltage", xlab = "datetime")
plot(mydata$datetime, mydata$Sub_metering_1, type="l",ylab = "Energy sub metering", xlab = "")
lines(mydata$datetime, mydata$Sub_metering_2, col = "Red") 
lines(mydata$datetime, mydata$Sub_metering_3, col = "Blue") 
legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n") 
plot(mydata$datetime, mydata$Global_reactive_power, type="l",ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png, file = "plot4.png", height = 480, width = 480) 
