# Author: Glen Friedman (glen.friedman@gmail.com)
# Creates a plot of "Global Active Power" values.
# and saves in png file.

source("loader.R")

# Get data from loader library.
dt <- get_data()

# Set png output.
png(file = "plot2.png", width = 480, height = 480, units = "px")

# Write out plot.
plot(dt$Datetime, dt$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# Close png.
dev.off()