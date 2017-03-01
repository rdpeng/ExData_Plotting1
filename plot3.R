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

# crate a vector with string values for each line color in the graph
lineColors = c("black", "red", "blue")

# Save to png image file named plot3.png
png(file = "plot3.png", width = 480, height = 480)

# Create a multi-line line graph with time (in days) on the x and energy sub metering on the y axis
plot(householdPowerConsumption$Sub_metering_1, ylab = "Energy sub metering", type = 'l', xaxt="n", xlab = "", col = lineColors[1]) #xaxt="n" removes the ticks
lines(householdPowerConsumption$Sub_metering_2, col = lineColors[2])
lines(householdPowerConsumption$Sub_metering_3, col = lineColors[3])
xtick <- c(0, numberOfObservations/2, numberOfObservations)
axis(side = 1, at=xtick, labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c(names(householdPowerConsumption)[7:9]), lwd=1, col = c("black", "red", "blue"))

# shut down open device (plot3.png)
dev.off()
