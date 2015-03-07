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


########### Making plot4 ###########
par(mfrow = c(2,2))

    ### First plot
par(mar = c(3,5,2,2))
with(household_power, plot(Date + Time,Global_active_power, type = "l",
                           ylab = "Global Active Power",
                           xlab = ""))


    ### Second plot
with(household_power, plot(Date + Time, Voltage, xlab = "datetime", type = "l"))


    ### Third plot
par(mar = c(2,4,2,2))
with(household_power, plot(Date + Time ,Sub_metering_1, type = "n",
                           ylab = "Energy sub metering"))
# in-canvas plots
with(household_power, lines(Date + Time, Sub_metering_1, type = "l", col = "black"))
with(household_power, lines(Date + Time, Sub_metering_2, type = "l", col = "red"))
with(household_power, lines(Date + Time, Sub_metering_3, type = "l", col = "blue"))
# Legends
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red","blue"), lty = c(1,1,1), cex = 0.45,
       x.intersp = 0.10, bty = "n", xjust = 0.2)


    ### Fourth plot
with(household_power, plot(Date + Time, Global_reactive_power, type = "l", xlab = "datetime"))

dev.copy(png, "proj1/plot4.png", width = 480, height = 480)
dev.off()