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

# Number of observations
numberOfObservations <- dim(householdPowerConsumption)[1]

# Save to png image file named plot2.png
png(file = "plot2.png", width = 480, height = 480)

# Create a line graph with time (in days) on the x and global active power on the y
plot(householdPowerConsumption$Global_active_power, ylab = "Global Active Power (kilowatts)", type = 'l', xaxt="n", xlab = "") #xaxt="n" removes the ticks
xtick <- c(0, numberOfObservations/2, numberOfObservations)
axis(side = 1, at=xtick, labels = c("Thu", "Fri", "Sat"))

# shut down open device (plot2.png)
dev.off() 