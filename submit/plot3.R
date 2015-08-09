# Plot 3. Data set should be in workdir with scripts.

# Read Data
pc <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract time range dataset
pc <- pc[(pc$Date=="1/2/2007" | pc$Date=="2/2/2007"),]

# Combine Date and Time
pc$DateTime <- strptime(paste(pc$Date, pc$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

# Open png device
png("plot3.png", width=480, height=480)

#plot lines and add legend
plot(pc$DateTime,pc$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(pc$DateTime,pc$Sub_metering_2, col="red")
lines(pc$DateTime,pc$Sub_metering_3, col="blue")
legend('topright',c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"))

#close device

dev.off()