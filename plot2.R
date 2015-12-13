setwd("E:/Learning/Master/Data Science/Exploratory Data Analysis/exdata-data-household_power_consumption/ExData_Plotting1")

source("Data_Load.R")

locale_original <- Sys.getlocale( category = "LC_TIME" )
Sys.setlocale("LC_TIME", "English")

png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")

#type	description
#p	points
#l	lines
plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)" ,type = "l")

dev.off()
