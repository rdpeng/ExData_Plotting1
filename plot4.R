# Author: Glen Friedman (glen.friedman@gmail.com)
# Creates a plot of Energy "sub metering" values.
# and saves in png file.

source("loader.R")

# Get data from loader library.
dt <- get_data()

# Set png output.
png(file = "plot4.png", width = 480, height = 480, units = "px")

# Set four plots (2x2).
par(mfrow = c(2, 2))

# Write out plots.
# Top-left (first) plot, of Global active power.
plot(dt$Datetime,
     dt$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# Top-right (second) plot, of Voltage.
plot(dt$Datetime,
     dt$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

# Bottom-left (third) plot, of sub-metering levels.
plot(dt$Datetime,
     dt$Sub_metering_1,
     type="l",
     col="black",
     xlab="",
     ylab="Energy sub metering")
lines(dt$Datetime, dt$Sub_metering_2, col="red")
lines(dt$Datetime, dt$Sub_metering_3, col="blue")

legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       bty="n")

# Bottom-right (fourth) plot, of Global reactive power.
plot(dt$Datetime,
     dt$Global_reactive_power,
     type="n",
     xlab="datetime",
     ylab="Global_reactive_power")

lines(dt$Datetime, dt$Global_reactive_power)

# Close png.
dev.off()