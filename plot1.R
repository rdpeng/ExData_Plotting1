# Rough calculation of memory
# 2,075,259 rows x 9 columns x 8 bytes/(double/string) = .14 gb
# plenty of space
# used grep to find the first row and 
# used as.Date(dates, "%d/%m/%Y")

# Creates header list 
header <- read.table("household_power_consumption.txt", nrow = 1, header = FALSE, sep = ";")

# Only reads in data for dates between 1/2/2007 00:00:00 and 2/2/2007 23:59:00
householdPowerConsumption <- read.table("household_power_consumption.txt", head = FALSE, sep = ";", skip = 66637, nrow = 2880)

# Set the header for householdPowerConsumption list
names(householdPowerConsumption) <- as.character(unlist(header))


# Save the result to a png file called plot1.png
png(file = "plot1.png", width = 480, height = 480)

# Create a histogram with global active power users on the x and frequency on the y.
hist(householdPowerConsumption$Global_active_power, main="Global Active Power",col = "red", xlab = "Global Active Power (kilowatts)")
axis(side = 2, at=c(0, 200, 400, 600, 800, 1000, 1200))

# shut down open device (plot1.png)
dev.off()