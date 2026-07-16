# Load the data and subset it
data1 = read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?")
data1$DateTime = as.POSIXct(paste(data1$Date, data1$Time), format="%d/%m/%Y %H:%M:%S")
data = subset(data1, Date == "1/2/2007" | Date == "2/2/2007")
data = rbind(data, data1[which(data1$DateTime == 
                                 as.POSIXct("03/02/2007 00:00:00", 
                                            format="%d/%m/%Y %H:%M:%S")),])

# Set parameters
par(mfrow = c(2,2), mar = c(3, 4, 2, 2))

# Create plot 1
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)", xaxt = "n")

thu_start <- min(data$DateTime) 
fri_start <- thu_start + 86400
sat_start <- max(data$DateTime)
ticks = c(thu_start, fri_start, sat_start)

axis.POSIXct(1, at = ticks, format = "%a")

# Create plot 2
plot(data$DateTime, data$Voltage, ylab = "Voltage", xlab = "datetime", type = "l",
     xaxt = "n")
axis.POSIXct(1, at = ticks, format = "%a")

# Create plot 3
plot(data$DateTime, data$Sub_metering_1, ylab = "Energy Sub Metering",
     xlab = "", xaxt = "n", type = "n")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2",
                  "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)
axis.POSIXct(1, at = ticks, format = "%a")

# Create plot 4
plot(data$DateTime, data$Global_reactive_power, ylab = "Global_reactive_power",
     xlab = "", xaxt = "n", type = "l")
axis.POSIXct(1, at = ticks, format = "%a")

# Copy to png
dev.copy(png, "plot4.png")
dev.off()
