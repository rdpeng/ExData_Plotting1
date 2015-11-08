# Project 1 code

# First loading necessary packages
library("graphics")
library("grDevices")
library("dplyr")

#reading and preparing data
housep <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = class, na.strings= "?")
housep <- mutate( housep, Date = as.Date(Date, "%d/%m/%Y"))
housep_rightdates <- filter (housep, Date > "2007-01-31")
housep_rightdates <- filter (housep_rightdates, Date < "2007-02-03")

#Ploting at the screen
with(housep_rightdates, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
axis (2, at = 200)
axis (2, at = 600)
axis (2, at = 1000)

#Saving in the PNG file
png(filename = "Plot1.png", width = 480, height = 480)
with(housep_rightdates, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
axis (2, at = 200)
axis (2, at = 600)
axis (2, at = 1000)
dev.off()