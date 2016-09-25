source("loadData.R")

## load data
df = loadData()

plot(df$Time,
     df$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

## add lines
lines(df$Time, df$Sub_metering_2, col = "red")
lines(df$Time, df$Sub_metering_3, col = "blue")

legend("topright",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1)

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
