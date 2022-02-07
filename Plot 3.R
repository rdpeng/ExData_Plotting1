library(lubridate)
library(dplyr)

if(!file.exists("C:\\Users\\sdanilola\\Documents\\MyProject\\Learning R\\ExData_Plotting1\\household_power_consumption")){dir.create("C:\\Users\\sdanilola\\Documents\\MyProject\\Learning R\\ExData_Plotting1\\household_power_consumption")}
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="household_power_consumption.zip")

unzip(zipfile = "household_power_consumption.zip", exdir = "C:\\Users\\sdanilola\\Documents\\MyProject\\Learning R\\ExData_Plotting1\\household_power_consumption")

##read data into R and Subset based on the Date needed
importdata <- read.csv("~/MyProject/Learning R/ExData_Plotting1/household_power_consumption/household_power_consumption.txt", sep=";")

power_consumption_feb <- subset(importdata, Date == "1/2/2007" | Date == "2/2/2007") %>% mutate(Date = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))),
                                                                                                Global_active_power = as.numeric(as.character(Global_active_power)),  sub_metering_1 = as.numeric(as.character(Sub_metering_1)),
                                                                                                sub_metering_2 = as.numeric(as.character(Sub_metering_2))) %>% select(Date,sub_metering_1,sub_metering_2,Sub_metering_3)

png(filename = "Plot 3.png", width = 480, height = 480)
with(power_consumption_feb, plot(Date,sub_metering_1, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(power_consumption_feb, points(Date,sub_metering_1, col="black", type="l"))
with(power_consumption_feb, points(Date,sub_metering_2, col="red", type="l"))
with(power_consumption_feb, points(Date,Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
dev.off()