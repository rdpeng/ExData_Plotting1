# Load the data and subset it
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";",
na.strings = "?")
data = subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Create a histogram of global active power
hist(data$Global_active_power, col = "red", main = "Global Active Power",
xlabs = "Global Active Power (kilowatts)")

# Copy the plot as a png
dev.copy(png, "plot1.png")
dev.off()