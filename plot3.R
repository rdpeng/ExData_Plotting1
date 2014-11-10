source("plot-load-data.R")

#
# PLOT 3
#
with(wattageSubset, {
  plot(DateTime, Sub_metering_1, main = "", xlab= "", type = "l",
    ylab = "Energy sub metering"
  )
  points(DateTime, Sub_metering_2, col = "red", type = "l")
  points(DateTime, Sub_metering_3, col = "blue", type = "l")
})

legend("topright",
  lty = c(1, 1),
  col = c("black", "red", "blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

# save png
dev.copy(png, "plot3.png")
dev.off()
