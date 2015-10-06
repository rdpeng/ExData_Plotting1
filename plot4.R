plot4 <- function() {

# Load File in "mydata"
        
filename <- "household_power_consumption.txt"
mydata <- read.table(filename,header = TRUE,sep =";",na.string="?")

# Create column with date and time

mydata$DateAndTime <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")

# Define initial and end dates and times

Ini_date <- as.POSIXct("2007-02-01 00:00:00")
End_date <- as.POSIXct("2007-02-02 23:59:59")

# Sub-select analysis period

mydata2 <- subset(mydata,DateAndTime >= Ini_date & DateAndTime <= End_date)

# Construct Plot 4 in PNG device

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

# Plots 1 and 2

plot(mydata2$DateAndTime, mydata2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(mydata2$DateAndTime, mydata2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3

plot(mydata2$DateAndTime, mydata2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(mydata2$DateAndTime, mydata2$Sub_metering_2, col = "red")
lines(mydata2$DateAndTime, mydata2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col = c("black","red","blue"))

# Plot 4

plot(mydata2$DateAndTime, mydata2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

}