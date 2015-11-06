# Coursera Exploratory Data Analysis
# Course Project 1
# 6/11/2015
# by Cocu23

# Read Data
powerconsumption <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?")

# only data from 2007-02-01 and 2007-02-02 will be extracted
workdata<- subset(powerconsumption, Date== "1/2/2007" | Date== "2/2/2007")

# QC if the right subset was created
names(workdata)
# Date, Time, Global_active_power, Global_Reactive_power, Voltage, 
# Global_intesity, Sub_metering_1, Sub_metering_2, Sub_metering_3

class(workdata$Date)
#factor

summary(workdata)
# 1/2/2007   2/2/2007
# 1440        1440

head(workdata)


## Plot 1
globalActivePower <- as.numeric(workdata$Global_active_power)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
