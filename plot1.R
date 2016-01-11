#Load in necessary libraries
library(dplyr)
library(data.table)

#Reads in data from file then subsets data for specified dates
fh <- fread("~/Exploratory Data Course/household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
pwrcons <- filter(fh, grep("^[1,2]/2/2007", Date))

#Convert global active power column, global reactive power colums, Sub_metering columns, and the Voltage column to numeric
pwrcons$Global_active_power <- as.numeric(as.character(pwrcons$Global_active_power))

pwrcons$Global_reactive_power <- as.numeric(as.character(pwrcons$Global_reactive_power))

pwrcons$Sub_metering_1 <- as.numeric(as.character(pwrcons$Sub_metering_1))
pwrcons$Sub_metering_2 <- as.numeric(as.character(pwrcons$Sub_metering_2))
pwrcons$Sub_metering_3 <- as.numeric(as.character(pwrcons$Sub_metering_3))

pwrcons$Voltage <- as.numeric(as.character(pwrcons$Voltage))

#Creates new column that combines date and time data 
pwrcons$Timestamp <-paste(pwrcons$Date, pwrcons$Time)

#Create histogram for Global Active Power
hist(pwrcons$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

##  Refer plot unnamed-chunk-2.png   
