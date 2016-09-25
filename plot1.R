source("loadData.R")

## load data
df = loadData()

hist(df$Global_active_power,
     main = paste("Global Active Power"),
     col = "red",
     xlab = "Global Active Power (kilowatts)")

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
