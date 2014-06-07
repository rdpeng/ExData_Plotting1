

# Read whole data into workspace using read.table
data <- read.table("household_power_consumption.txt", header=T, sep=';')

# Subset only Feb 1 and 2
feb <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Convert Date and Time
feb$DateTime <- strptime(paste(feb$Date, feb$Time), format="%d/%m/%Y %H:%M:%S")

# Plot histogram
par(mfrow=c(1,1))
png(filename='plot2.png', width=480, height=480, bg='transparent')
plot(x=feb$DateTime, y=as.numeric(feb$Global_active_power), type='l', ylab='Global Active Power (kilowatts)', xlab='')
dev.off()