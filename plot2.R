# read the data
observation.dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
consumption <- read.csv(
  "household_power_consumption.txt", 
  header = TRUE, 
  na.strings = "?",
  sep = ";"
)
consumption.for.plotting <- consumption[as.Date(consumption$Date, "%d/%m/%Y") %in% observation.dates, ]

png(filename = "plot2.png", width = 480, height = 480)

# draw it
x.date.time <- strptime(
  paste(consumption.for.plotting$Date, consumption.for.plotting$Time, sep=" "), 
  "%d/%m/%Y %H:%M:%S"
)
y.global.active.power <- consumption.for.plotting$Global_active_power
plot(x.date.time, y.global.active.power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()