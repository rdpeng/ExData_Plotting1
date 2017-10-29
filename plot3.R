#Exploratory Data Analysis Project 1
#October 29 2017

#Plot3
#The data file is assumed to be sitting in a local C directory
setwd("C:/")

mydata = read.table("household_power_consumption.txt", header=TRUE, sep = ";",na.strings = "?")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- subset(mydata, (Date >= "2007-02-01" & Date <= "2007-02-02")) 

mydata$datetime <- strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S") 

plot(mydata$datetime, mydata$Sub_metering_1, type="l",ylab = "Energy sub metering", xlab = "")
lines(mydata$datetime, mydata$Sub_metering_2, col = "Red") 
lines(mydata$datetime, mydata$Sub_metering_3, col = "Blue") 
legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

dev.copy(png, file = "plot3.png", height = 480, width = 480) 
