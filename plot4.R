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

# Setup windows
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2)) # 2x2 window

################ Graph 1
plot(householdPowerConsumption$Global_active_power, ylab = "Global Active Power", type = 'l', xaxt="n", xlab = "") #xaxt="n" removes the ticks
xtick <- c(0, numberOfObservations/2, numberOfObservations)
axis(side = 1, at=xtick, labels = c("Thu", "Fri", "Sat"))

################ Graph 2
plot(householdPowerConsumption$Voltage, ylab = "Voltage", type = 'l', xaxt="n", xlab = "datetime") #xaxt="n" removes the ticks
xtick <- c(0, numberOfObservations/2, numberOfObservations)
axis(side = 1, at=xtick, labels = c("Thu", "Fri", "Sat"))

################ Graph 3
lineColors = c("black", "red", "blue")
# Create a histogram with global active power users on the x and frequency on the y
plot(householdPowerConsumption$Sub_metering_1, ylab = "Energy sub metering", type = 'l', xaxt="n", xlab = "", col = lineColors[1]) #xaxt="n" removes the ticks
lines(householdPowerConsumption$Sub_metering_2, col = lineColors[2])
lines(householdPowerConsumption$Sub_metering_3, col = lineColors[3])

xtick <- c(0, numberOfObservations/2, numberOfObservations)

axis(side = 1, at=xtick, labels = c("Thu", "Fri", "Sat"))

legend("topright", legend = c(names(householdPowerConsumption)[7:9]), lwd=1, col = c("black", "red", "blue"), bty = "n")

################ Graph 4
plot(householdPowerConsumption$Global_reactive_power, ylab="Global_reactive_power", type = 'l', xaxt="n", xlab = "") #xaxt="n" removes the ticks
xtick <- c(0, numberOfObservations/2, numberOfObservations)
axis(side = 1, at=xtick, labels = c("Thu", "Fri", "Sat"))

# shut down open device (plot4.png)
dev.off() 
