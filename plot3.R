# Set working directory and data file 
setwd('/home/user/exploratory_data/data')
file_data <- 'household_power_consumption.txt'

# Read file into R data frame
power_consumption <- read.table(file_data, header=TRUE, sep=';', na.strings='?')

# Show names
names(power_consumption)

# Filter and add formatted date and time columns
power_consumption$date <- as.Date (power_consumption$Date, '%d/%m/%Y')
power_consumption <- subset(power_consumption, date=='2007-02-01'|date=='2007-02-02')
power_consumption$time <- strptime(paste(power_consumption$date, power_consumption$Time), format="%Y-%m-%d %H:%M:%S")

# Create plot3.png
png('plot3.png')
plot(power_consumption$time, power_consumption$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(power_consumption$time, power_consumption$Sub_metering_2, type='l', col='red')
lines(power_consumption$time, power_consumption$Sub_metering_3, type='l', col='blue')
legend('topright', lty=c(1, 1, 1), col = c('black', 'blue', 'red'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()
