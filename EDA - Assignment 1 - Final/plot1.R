rm(list = ls())
library(dplyr)

#Download and Read File
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "ElecPowerConsumption.zip")
unzip("ElecPowerConsumption.zip", files = "household_power_consumption.txt")
power = read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Assign appropriate classes to columns
power$Date = as.character(power$Date)
power$Time = as.character(power$Time)
power$Global_active_power = as.numeric(power$Global_active_power)
power$Global_reactive_power = as.numeric(power$Global_reactive_power )
power$Voltage = as.numeric(power$Voltage )
power$Global_intensity = as.numeric(power$Global_intensity)
power$Sub_metering_1 = as.numeric(power$Sub_metering_1 )
power$Sub_metering_2 = as.numeric(power$Sub_metering_2 )
power$Sub_metering_3 = as.numeric(power$Sub_metering_3 )

#Extract the 2 day Data
power$Date = as.Date(power$Date, "%d/%m/%Y")
a = as.Date(c("2007-02-01", "2007-02-02"))
power_select = filter(power, power$Date %in% a)

#Creating Plot 1
png(filename = "Plot1.png", width = 480, height = 480, units = "px")
hist(power_select$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")