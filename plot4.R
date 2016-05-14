# Imports data
fd <- read.table("household_power_consumption.txt", header = TRUE
                 , sep = ";", na.strings = "?", 
                 colClasses = c("character", "character", rep("numeric", 7)))

# Subsets data
fd$Date <- as.Date(fd$Date, format = "%d/%m/%Y")
fd$Time <- strptime(fd$Time, format = "%H:%M:%S")
fd_Feb07 <- subset(fd, Date == "2007-02-01" | Date == "2007-02-02")

# Opens PNG device; creates "plot1.png" in my working directory
png(file = "plot4.png", width = 480, height = 480)

# Sets parameters
par(mfcol = c(2, 2), mar = c(5, 5, 4, 1), cex = 0.8)

# Creates 1st plot in 1st column; Global active power data

with(fd_Feb07, {
        plot(Global_active_power, type = "n", 
             xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
        lines(Global_active_power)
})

v1 <- c(0, 1440, 2880) ## define position of x-axis tick marks 
v2 <- c("Thu", "Fri", "Sat") ## define labels of x-axis tick marks
axis(1, v1, v2) ## draw x-axis

# Creates 2nd plot in 1st column; Energy_sub_metering data
with(fd_Feb07, {
        plot(Sub_metering_1, type = "n", 
             xaxt = "n", xlab = "", ylab = "Energy sub metering")
        lines(Sub_metering_1)
        lines(Sub_metering_2, col = "red")
        lines(Sub_metering_3, col = "blue")
}
)

v1 <- c(0, 1440, 2880) ## define position of x-axis tick marks 
v2 <- c("Thu", "Fri", "Sat") ## define labels of x-axis tick marks
axis(1, v1, v2) ## draw x-axis

## Adds legend
legend("topright", lty = 1, col = c("Black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Creates 1st plot in 2nd column; Voltage data
with(fd_Feb07, {
        plot(Voltage, type = "n", 
             xaxt = "n", xlab = "datetime", ylab = "Global Active Power (kilowatts)")
        lines(Voltage)
})

v1 <- c(0, 1440, 2880) ## define position of x-axis tick marks 
v2 <- c("Thu", "Fri", "Sat") ## define labels of x-axis tick marks
axis(1, v1, v2) ## draw x-axis

# Creates 2nd plot in 2nd column; Global reactive power data
with(fd_Feb07, {
        plot(Global_reactive_power, type = "n", 
             xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
        lines(Global_reactive_power)
})

v1 <- c(0, 1440, 2880) ## define position of x-axis tick marks 
v2 <- c("Thu", "Fri", "Sat") ## define labels of x-axis tick marks
axis(1, v1, v2) ## draw x-axis

# Close PNG file device
dev.off()