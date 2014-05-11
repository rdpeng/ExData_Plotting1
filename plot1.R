# plot1.R - Histogram of Global Active Power

# Read data, convert dates and subset on two days in February 2007
data <- read.table('/Users/sebastiancarrasco/Downloads/household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')
data$DateTime <- strptime(paste(data$Date, data$Time), 
                          "%d/%m/%Y %H:%M:%S")
data <- subset(data, 
               as.Date(DateTime) >= as.Date("2007-02-01") & 
                   as.Date(DateTime) <= as.Date("2007-02-02"))

# Open plot1.png
png("plot1.png", height=480, width=480)

# Build histogram
hist(data$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

# Close PNG file
dev.off()

