#Exploratory Data Analysis Project 1
#October 29 2017

#Plot2
#The data file is assumed to be sitting in a local C directory
setwd("C:/")

mydata = read.table("household_power_consumption.txt", header=TRUE, sep = ";",na.strings = "?")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- subset(mydata, (Date >= "2007-02-01" & Date <= "2007-02-02")) 

mydata$datetime <- strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S") 

plot(mydata$datetime, mydata$Global_active_power, type="l",ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png", height = 480, width = 480) 

