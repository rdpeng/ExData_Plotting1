par(mfrow = c(2,2), mar = c("4.5","4","2","1"))

png(filename = "plot4.png", width = 480, height = 480)

#Top Left Plot


with(elec_data, plot(Date_Time, Global_active_power, type = "l", xlab = "", cex.lab = 0.7))


#Top Right Plot

with(elec_data, plot(Date_Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.lab = 0.7))


#Bottom Left Plot

with(elec_data, {
  plot(Date_Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", cex.lab = 0.7)
  lines(Date_Time, Sub_metering_1, col = "black")
  lines(Date_Time, Sub_metering_2, col = "red")
  lines(Date_Time, Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.7)
})

#Bottom Left Plot

with(elec_data, plot(Date_Time, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l", cex.lab = 0.7, lwd = 0.7))

dev.off()