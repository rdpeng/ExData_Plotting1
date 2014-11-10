source("plot-load-data.R")

#
# PLOT 4
#
par(mfcol = c(2,2))

with(wattageSubset, {
  #
  # Sub Plot 1
  #
  plot(DateTime, Global_active_power,
    main = "", ylab = "Global Active Power", xlab= "", type = "l")

  #
  # Sub Plot 2
  #
  plot(DateTime, Sub_metering_1, main = "", xlab= "", type = "l",
    ylab = "Energy sub metering")
  points(DateTime, Sub_metering_2, col = "red", type = "l")
  points(DateTime, Sub_metering_3, col = "blue", type = "l")

  legend("topright", lty = c(1, 1), col = c("black", "red", "blue"),
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  )

  #
  # Sub Plot 3
  #
  plot(DateTime, Voltage, main = "", type = "l")

  #
  # Sub Plot 4
  #
  plot(DateTime, Global_reactive_power, main = "", type = "l")
})


# save png
dev.copy(png, "plot4.png")
dev.off()
