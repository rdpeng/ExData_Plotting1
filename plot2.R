source("plot-load-data.R")

#
# PLOT 2
#
with(wattageSubset, {
  plot(DateTime, Global_active_power,
    main = "",
    ylab = "Global Active Power (kilowatts)",
    xlab= "",
    type = "l"
  )
})

dev.copy(png, "plot2.png")
dev.off()
