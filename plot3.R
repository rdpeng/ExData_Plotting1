# Read the data
electric <- read.table("data6/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Make from the Date (character) a real Date field and select only the two days we want
electric <- mutate(electric, Date2 = as.Date(Date, "%d/%m/%Y"))
electricFeb <- subset(electric, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))

# Create a DateTime field
electricFeb <- mutate(electricFeb, DateTime = strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))

# Make line graph for 3
# Don't know how to get english abbreviation in the x-axis
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(electricFeb$DateTime, electricFeb$Sub_metering_1, type = 'l', ylab = "Energy sub metering", xlab = "")
lines(electricFeb$DateTime, electricFeb$Sub_metering_2, col = "red")
lines(electricFeb$DateTime, electricFeb$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1))
dev.off()