setwd("E:/Learning/Master/Data Science/Exploratory Data Analysis/exdata-data-household_power_consumption/ExData_Plotting1")

source("Data_Load.R")

locale_original <- Sys.getlocale( category = "LC_TIME" )
Sys.setlocale("LC_TIME", "English")

png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent" ) 
par(mfrow = c(2, 2)) #par(2,2) to divide the plot to 4 squares

#Box 1 top left par (1,1)

plot(DateTime, Global_active_power, type = "l",xlab = "", ylab = "Global Active Power")

#Box 2 top right par (1,2)
plot(DateTime, Voltage,type = "l",xlab = "datetime", ylab = "Voltage")

#Box 3 Buttom Left par (2,1)
plot(DateTime, Sub_metering_1, col = "black",type = "l",xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")

legend("topright",bty = "n",col = c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd = 1)

#Box 4 Buttom right par (2,2)
plot(DateTime, Global_reactive_power, col = "black",type = "l", xlab = "datetime",ylab = "Global_reactive_power")

dev.off()
