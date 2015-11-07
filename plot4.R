# Read the data
electric <- read.table("data6/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Make from the Date (character) a real Date field and select only the two days we want
electric <- mutate(electric, Date2 = as.Date(Date, "%d/%m/%Y"))
electricFeb <- subset(electric, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))

# Create a DateTime field
electricFeb <- mutate(electricFeb, DateTime = strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))

# Create the 4 plots
plot1 <- function() { 
  plot(electricFeb$DateTime, electricFeb$Global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")
}

plot2 <- function() {
  plot(electricFeb$DateTime, electricFeb$Sub_metering_1, type = 'l', ylab = "Energy sub metering", xlab = "")
  lines(electricFeb$DateTime, electricFeb$Sub_metering_2, col = "red")
  lines(electricFeb$DateTime, electricFeb$Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1))
}

plot3 <- function() {
  plot(electricFeb$DateTime, electricFeb$Voltage, type = 'l', ylab = "Voltage", xlab = "datetime")
}

plot4 <- function() {
  plot(electricFeb$DateTime, electricFeb$Global_reactive_power, type = 'l', ylab = "Global_reactive_power", xlab = "datetime")
}

# Create the png with the four images
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2,2))
plot1()
plot2()
plot3()
plot4()
dev.off()
