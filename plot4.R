# load the data set
# this script assumes data file is unzipped in your working directory
# note: if you have already read the data and formatted from previous plots, then skip directly to the plot function

energy.consumption <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header=TRUE)

# convert dates
energy.consumption$Date <- as.Date(energy.consumption$Date, format="%d/%m/%Y")

# we only want the subset between 2/1/07 and and 2/2/07
energy.consumption <- subset(energy.consumption, energy.consumption$Date >= as.Date("2007-02-01"))
energy.consumption <- subset(energy.consumption, energy.consumption$Date <= as.Date("2007-02-02"))

# time is recorded as total time passed since the beginning of each day, need to merge time readings to each day
energy.consumption$Time <- paste(energy.consumption$Date,energy.consumption$Time,sep="")
energy.consumption$Date <- strptime(energy.consumption$Time, format = "%Y-%m-%d %H:%M:%S")

# start here if data has already been processed!

# for the final plots, we will be repeating some previous plot commands after passing 'par' to get them in the same matrix

# finally, plot it and save .png to current working directory
png("plot4.png", height = 480, width = 480, units = "px")
par(mfrow=c(2,2))

# first, active power usage
plot(energy.consumption$Date, energy.consumption$Global_active_power, type = "l", ylab = "Global Active Power Usage (kW)", xlab = "Days")

# second, voltage
plot(energy.consumption$Date, energy.consumption$Voltage, type = "l", ylab = "Global Active Voltage Usage", xlab = "Days")

# third, sub metering plot
plot(energy.consumption$Date, energy.consumption$Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "Days")
lines(x=energy.consumption$Date, y = energy.consumption$Sub_metering_1, lty = "solid")
lines(x=energy.consumption$Date, y = energy.consumption$Sub_metering_2, lty="solid", col = "red")
lines(x=energy.consumption$Date, y = energy.consumption$Sub_metering_3, lty="solid", col = "blue")
legend("topright", lty="solid", col = c("black","blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# fourth, reactive power usage
plot(energy.consumption$Date, energy.consumption$Global_reactive_power, type = "l", ylab = "Global Reactive Power Usage (kW)", xlab = "Datetime")

dev.off()
