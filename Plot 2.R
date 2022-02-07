library(lubridate)
library(dplyr)

if(!file.exists("C:\\Users\\sdanilola\\Documents\\MyProject\\Learning R\\ExData_Plotting1\\household_power_consumption")){dir.create("C:\\Users\\sdanilola\\Documents\\MyProject\\Learning R\\ExData_Plotting1\\household_power_consumption")}
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="household_power_consumption.zip")

unzip(zipfile = "household_power_consumption.zip", exdir = "C:\\Users\\sdanilola\\Documents\\MyProject\\Learning R\\ExData_Plotting1\\household_power_consumption")

##read data into R and Subset based on the Date needed
importdata <- read.csv("~/MyProject/Learning R/ExData_Plotting1/household_power_consumption/household_power_consumption.txt", sep=";")

power_consumption_feb <- subset(importdata, Date == "1/2/2007" | Date == "2/2/2007") %>% mutate(Date = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))),
                                                                                                Global_active_power = as.numeric(as.character(Global_active_power))) %>% select(Date,Global_active_power)

png(filename = "Plot 2.png", width = 480, height = 480)
with(power_consumption_feb, plot (Date, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
