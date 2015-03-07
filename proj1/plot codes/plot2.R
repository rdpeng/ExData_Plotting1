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

########### Making plot1 ###########
par(mar = c(3,5,2,2))
with(household_power, plot(Date + Time,Global_active_power, type = "l",
                           ylab = "Global Active Power",
                           xlab = ""))

dev.copy(png, "./proj1/plot2.png", width = 480, height = 480)
dev.off()
