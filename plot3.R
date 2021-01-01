png(filename = "plot3.png", width = 480, height = 480)
with(elec_data, {
  plot(Date_Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(Date_Time, Sub_metering_1, col = "black")
  lines(Date_Time, Sub_metering_2, col = "red")
  lines(Date_Time, Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.7)
})
dev.off()