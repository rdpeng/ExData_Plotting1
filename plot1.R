# Author: Glen Friedman (glen.friedman@gmail.com)
# Creates a histogram of "Global Active Power" frequency.

source("loader.R")

# Get data from loader library.
dt <- get_data()

# Set png output.
png(file = "plot1.png", width = 480, height = 480, units = "px")

# Write out histogram.
hist(dt$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

# Close png.
dev.off()
