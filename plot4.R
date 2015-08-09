# read the data
observation.dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
consumption <- read.csv(
  "household_power_consumption.txt", 
  header = TRUE, 
  na.strings = "?",
  sep = ";"
)
consumption.for.plotting <- consumption[as.Date(consumption$Date, "%d/%m/%Y") %in% observation.dates, ]

png("plot4.png", width = 480, height = 480)

# partition into 2x2
par(mfrow = c(2, 2))
x.date.time <- strptime(
  paste(consumption.for.plotting$Date, consumption.for.plotting$Time, sep=" "), 
  "%d/%m/%Y %H:%M:%S"
)

# draw the top left corner
y.global.active.power <- consumption.for.plotting$Global_active_power
plot(x.date.time, y.global.active.power, type = "l", xlab = "", ylab = "Global Active Power")

# draw top right corner
y.voltage <- consumption.for.plotting$Voltage
plot(x.date.time, y.voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# draw bottom left corner
y.sub.metering.1 <- consumption.for.plotting$Sub_metering_1
y.sub.metering.2 <- consumption.for.plotting$Sub_metering_2
y.sub.metering.3 <- consumption.for.plotting$Sub_metering_3
plot(x.date.time, y.sub.metering.1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x.date.time, y.sub.metering.2, type = "l", col = "red")
lines(x.date.time, y.sub.metering.3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

# draw bottom right corner
y.global.reactive.power <- consumption.for.plotting$Global_reactive_power
plot(x.date.time, y.global.reactive.power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()