# First loading necessary packages
library("graphics")
library("grDevices")
library("dplyr")

#reading and preparing data
housep <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = class, na.strings= "?")
housep <- mutate( housep, Date = as.Date(Date, "%d/%m/%Y"))
housep_rightdates <- filter (housep, Date > "2007-01-31")
housep_rightdates <- filter (housep_rightdates, Date < "2007-02-03")

#making the plot
housep_rightdates <- mutate (housep_rightdates, DateTime <- paste(Date, Time))
Datetime <- strptime(housep_rightdates$DateTime, "%Y-%m-%d %H:%M:%S")
plot(Datetime, housep_rightdates$Global_active_power, type ="l", ylab ="Global Active Power", xlab = " ", xaxt = "s")

#making the png file
png(filename = "Plot2.png", width = 480, height = 480)
housep_rightdates <- mutate (housep_rightdates, DateTime <- paste(Date, Time))
Datetime <- strptime(housep_rightdates$DateTime, "%Y-%m-%d %H:%M:%S")
plot(Datetime, housep_rightdates$Global_active_power, type ="l", ylab ="Global Active Power", xlab = " ", xaxt = "s")
dev.off()

