setwd("E:/Learning/Master/Data Science/Exploratory Data Analysis/exdata-data-household_power_consumption/ExData_Plotting1")

source("Data_Load.R")

locale_original <- Sys.getlocale( category = "LC_TIME" )
Sys.setlocale("LC_TIME", "English")

png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

plot(DateTime, Sub_metering_1, col = "black",xlab = "", ylab = "Energy sub metering",type = "l")
     
lines(DateTime, Sub_metering_2, col = "red")

lines(DateTime, Sub_metering_3, col = "blue")

legend("topright",col = c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd = 1)


dev.off()
