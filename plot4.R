source("loadData.R")

# load data
df = loadData()

## 2x2 layout
par(mfrow = c(2, 2))

## plot 1
plot(df$Time,
     df$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

## plot 2
plot(df$Time,
     df$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

## plot 3
plot(df$Time,
     df$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(df$Time, df$Sub_metering_2, col = "red")
lines(df$Time, df$Sub_metering_3, col = "blue")

legend("topright",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       bty = 0,
       cex = .5)

## plot 4
plot(df$Time,
     df$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()