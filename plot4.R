epc_plot4 <- epc_plot3

epc_plot4$Voltage <- as.numeric(epc_plot4$Voltage)
epc_plot4$Global_reactive_power <- as.numeric(epc_plot4$Global_reactive_power)

png(file = "F:/datascience/rworkspace/sophia/ExData_Plotting1/plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))
with(epc_plot4, {
  plot(Dayofweek, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  plot(Dayofweek, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  with(epc_plot4, plot(Dayofweek, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
  with(epc_plot4, lines(Dayofweek, Sub_metering_1, col = "black"))
  with(epc_plot4, lines(Dayofweek, Sub_metering_2, col = "red"))
  with(epc_plot4, lines(Dayofweek, Sub_metering_3, col = "blue"))
  legend("topright", lty = c(1,1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Dayofweek, Global_reactive_power, type = "l", xlab = "")
})

dev.off()