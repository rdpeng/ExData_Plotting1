# Project 1
# Author: Christopher Mahoney
# Date: 4/11/2015

# Read in electric power subset dataset

column_names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
column_types = c("date", "time", rep("numeric",7))

DF_power <- read.csv("Project1/household_power_consumption_subset.txt", sep = ";", col.names = column_names, colClasses = column_types )
str(DF_power)
