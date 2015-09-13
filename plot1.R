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

# Create plot1.png file
png('plot1.png')
hist(power_consumption$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off()
