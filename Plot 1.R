library(lubridate)

if(!file.exists("C:\\Users\\sdanilola\\Documents\\MyProject\\Learning R\\ExData_Plotting1\\household_power_consumption")){dir.create("C:\\Users\\sdanilola\\Documents\\MyProject\\Learning R\\ExData_Plotting1\\household_power_consumption")}
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="household_power_consumption.zip")

unzip(zipfile = "household_power_consumption.zip", exdir = "C:\\Users\\sdanilola\\Documents\\MyProject\\Learning R\\ExData_Plotting1\\household_power_consumption")

##read data into R and Subset based on the Date needed
importdata <- read.csv("~/MyProject/Learning R/ExData_Plotting1/household_power_consumption/household_power_consumption.txt", sep=";")

power_consumption_feb <- subset(importdata, Date == "1/2/2007" | Date == "2/2/2007")

power_consumption_feb$Date <- as.Date(parse_date_time(power_consumption_feb$Date, c('dmy')))
power_consumption_feb$Global_active_power <- as.numeric(power_consumption_feb$Global_active_power)

png(filename = "Plot 1.png", width = 480, height = 480)
with(power_consumption_feb, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = paste("Global Active Power")))
dev.off()

