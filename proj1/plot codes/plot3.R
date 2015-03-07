setwd("./Dropbox/courses/R_prog/EDA/week1/")
if(!file.exists("proj1")){dir.create("proj1")}
library(lubridate)

########### Reading the data ###########
household_power <- read.table("household_power_consumption.txt", na.strings = "?",
                              sep = ";", header = TRUE)

# Getting Date and Time in POSIXt and lubridate class for time respectively
household_power$Date <- dmy(household_power$Date)
household_power$Time <- hms(household_power$Time)
# Subsetting to get the columns which are exclusively in the 2007-02-01 - 2007-02-02 range  
household_power <-
  household_power[household_power$Date == ymd("2007-02-01") | household_power$Date == ymd("2007-02-02"),]


########### Making plot3 ###########

# Base plot
par(mar = c(2,4,2,4))
with(household_power, plot(Date + Time ,Sub_metering_1, type = "n",
                           ylab = "Energy sub metering"))
# in-canvas plots
with(household_power, lines(Date + Time, Sub_metering_1, type = "l", col = "black"))
with(household_power, lines(Date + Time, Sub_metering_2, type = "l", col = "red"))
with(household_power, lines(Date + Time, Sub_metering_3, type = "l", col = "blue"))
# Legends
metering_legends <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend = metering_legends, col = c("black","red","blue"), lty = c(1,1,1), seg.len = 0.8, cex = 0.6,
       text.widths)

dev.copy(png, file = "proj1/plot3.png", width = 480, height = 480)
dev.off()