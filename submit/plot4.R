# Plot 3. Data set should be in workdir with scripts.

# Read Data
pc <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract time range dataset
pc <- pc[(pc$Date=="1/2/2007" | pc$Date=="2/2/2007"),]

# Combine Date and Time
pc$DateTime <- strptime(paste(pc$Date, pc$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

# Open png device
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))
#1
#plot 2
plot(pc$DateTime, pc$Global_active_power, type="l", 
           xlab="", ylab="Global Active Power")
#2
plot(pc$DateTime,pc$Voltage , type='l', xlab='datetime', ylab='Voltage')


#3
#plot 3
#plot lines and add legend
plot(pc$DateTime,pc$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(pc$DateTime,pc$Sub_metering_2, col="red")
lines(pc$DateTime,pc$Sub_metering_3, col="blue")
legend('topright',c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"))

#4
#plot 4
plot(pc$DateTime,pc$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')

#close device
dev.off()