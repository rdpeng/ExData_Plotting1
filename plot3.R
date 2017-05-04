epc_plot3 <- epc_plot2

epc_plot3$Sub_metering_1 <- as.numeric(epc_plot3$Sub_metering_1)
epc_plot3$Sub_metering_2 <- as.numeric(epc_plot3$Sub_metering_2)
epc_plot3$Sub_metering_3 <- as.numeric(epc_plot3$Sub_metering_3)


png(file = "F:/datascience/rworkspace/sophia/ExData_Plotting1/plot3.png", width = 480, height = 480, units = "px")


with(epc_plot3, plot(Dayofweek, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(epc_plot3, lines(Dayofweek, Sub_metering_1, col = "black"))
with(epc_plot3, lines(Dayofweek, Sub_metering_2, col = "red"))
with(epc_plot3, lines(Dayofweek, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1,1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

