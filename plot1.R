source("plot-load-data.R")

#
# PLOT 1
#
hist(wattageSubset$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)

dev.copy(png, "plot1.png")
dev.off()
