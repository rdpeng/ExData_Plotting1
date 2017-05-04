epc_plot2 <- epc_plot1

epc_plot2$Dayofweek <- as.POSIXct(paste(epc_plot2$Date,epc_plot2$Time), format="%Y-%m-%d %H:%M:%S")

png(file = "F:/datascience/rworkspace/sophia/ExData_Plotting1/plot2.png", width = 480, height = 480, units = "px")

plot(epc_plot2$Dayofweek, epc_plot2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()