# Author: Glen Friedman (glen.friedman@gmail.com)
# Creates a plot of Energy "sub metering" values.
# and saves in png file.

source("loader.R")

# Get data from loader library.
dt <- get_data()

# Set png output.
png(file = "plot3.png", width = 480, height = 480, units = "px")

# Write out plot.
plot(dt$Datetime,
     dt$Sub_metering_1,
     type="l",
     col="black",
     xlab="",
     ylab="Energy sub metering")
lines(dt$Datetime, dt$Sub_metering_2, col="red")
lines(dt$Datetime, dt$Sub_metering_3, col="blue")

# Add the legend.
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

# Close png.
dev.off()