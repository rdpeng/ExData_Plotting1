library(lubridate)
library(dplyr)

if(!file.exists("C:\\Users\\sdanilola\\Documents\\MyProject\\Learning R\\ExData_Plotting1\\household_power_consumption")){dir.create("C:\\Users\\sdanilola\\Documents\\MyProject\\Learning R\\ExData_Plotting1\\household_power_consumption")}
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile="household_power_consumption.zip")

unzip(zipfile = "household_power_consumption.zip", exdir = "C:\\Users\\sdanilola\\Documents\\MyProject\\Learning R\\ExData_Plotting1\\household_power_consumption")

##read data into R and Subset based on the Date needed
importdata <- read.csv("~/MyProject/Learning R/ExData_Plotting1/household_power_consumption/household_power_consumption.txt", sep=";")

power_consumption <- subset(importdata, Date == "1/2/2007" | Date == "2/2/2007") %>% mutate(Date = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))),
                        global_active_power= as.numeric(as.character(Global_active_power)),
                        global_reactive_power = as.numeric(as.character(Global_reactive_power)),
                        voltage = as.numeric(as.character(Voltage)),
                        sub_metering_1 = as.numeric(as.character(Sub_metering_1)),
                        sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
                        sub_metering_3 = as.numeric(as.character(Sub_metering_3)))
png(filename = "Plot 4.png", width = 480, height = 480)

par(mfrow = c(2, 2))
with(power_consumption, plot(Date,global_active_power, col = "black", type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(power_consumption, plot(Date,voltage, col = "black", type = "l", xlab = "datetime", ylab = "Voltage"))
with(power_consumption, plot(Date,sub_metering_1, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(power_consumption, points(Date,sub_metering_1, col="black", type="l"))
with(power_consumption, points(Date,sub_metering_2, col="red", type="l"))
with(power_consumption, points(Date,sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

with(power_consumption, plot(Date,global_reactive_power, col = "black", type = "l", xlab = "Global Reactive Power", ylab = "datetime"))
dev.off()
