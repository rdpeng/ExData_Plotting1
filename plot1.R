
# Read whole data into workspace using read.table
data <- read.table("household_power_consumption.txt", header=T, sep=';')

# Subset only Feb 1 and 2
feb <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Plot histogram
par(mfrow=c(1,1))
png(filename='plot1.png', width=480, height=480, bg='transparent')
hist(as.numeric(feb$Global_active_power), xlab='Global Active Power (kilowatts)', main='Global Active Power', col='red')
dev.off()