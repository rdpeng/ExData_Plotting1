# multiple base plots: global active power, voltage, energy sub metering and 
# global reactive power as functions of weekdays

# 1. Download and read data 

setwd("/Users/daniela/Desktop/Data Science Coursera/4-Exploratory_Data_Analysis/Assignment1/ExData_Plotting1")
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("household_power_consumption.txt")){ download.file(fileurl,destfile = "household_power_consumption.txt")} 
powerData <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

# 2. Add new time class column including both date and time and convert the Date 
# and Time variables to Date/Time classes

powerData$dateTime <- strptime(paste(powerData$Date,powerData$Time),"%d/%m/%Y %H:%M:%S")

library(lubridate)
powerData$Date <- dmy(powerData$Date)
powerData$Time <- hms(powerData$Time)

# 3. Convert global active power variable, global reactive power and voltage to 
# numeric & subset data with desired dates ( 2007-02-01 and 2007-02-02)

library(dplyr)
powerData$Global_active_power <- as.numeric(powerData$Global_active_power)
powerData$Voltage <- as.numeric(powerData$Voltage)
powerData$Global_reactive_power <- as.numeric(powerData$Global_reactive_power)
powerData2 <- filter(powerData, Date == "2007-02-02"|Date=="2007-02-01") 

# 4. Construct the plot and save it to a PNG file with a width of 480 pixels 
# and a height of 480 pixels.

png(filename="plot4.png", width=480, height=480, units = "px")
par(mfrow = c(2,2), oma=c(0,2,0,0))
with(powerData2,{ 
        plot(dateTime, Global_active_power, 
                type="l",
                main = NULL, 
                ylab="Global Active Power (kilowatts)",
                xlab = " ")
        plot(dateTime,Voltage,
                type="l",
                main = NULL, 
                ylab="Voltage",
                xlab = "datetime")
        plot(dateTime, Sub_metering_1, 
                type="l",
                main = NULL, 
                ylab="Energy sub metering",
                xlab = " ")
        points(dateTime, Sub_metering_2, 
                type="l",
                col = "red")
        points(dateTime, Sub_metering_3, 
                type="l",
                col = "blue")
        legend("topright", 
                lty = 1,
                bty ="n",
                col = c("black","red","blue"),
                legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
        plot(dateTime, Global_reactive_power, 
             type="l",
             main = NULL, 
             ylab="Global_reactive_power",
             xlab = "datetime")})
dev.off()


