rm(list=ls()) # clear environment
set.seed(6583) # setting seed for reproducibility, in case of random number gen. 
library("ggplot2")
library("lubridate")

HEC <- read.csv("D:/Coursera/ExData_Plotting1/WorkingData/power_consumption_2_day.csv", header = TRUE)

summary(HEC) # No missing values found, 0's assumed to be correct values
View(HEC) # displays the first 1000 rows

wkday <- wday(HEC$Date, label = TRUE, abbr=TRUE) # To extract weekday, not used just wanted to check functionality

#convert individual variables and convert
datetime <- paste(HEC$Date, HEC$Time)
DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

par(mfrow = c(1,1))

#remove x-label, 
plot(DateTime, HEC$Global_active_power,  type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


#copy the png file to working directory
dev.copy(png, file="Plot2.png", width=480, height=480)
dev.off()
