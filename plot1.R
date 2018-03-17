data <- read.table('household_power_consumption.txt', header=FALSE, sep=';', skip=66637, nrows=2880, 
                   na.strings='?', stringsAsFactors = FALSE)
names(data) = c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage',
                'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
data$DateTime <- with(data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
png(file = "plot1.png", width = 480, height = 480, units = 'px')
hist(data$Global_active_power, main = 'Global Active Power', col='red', 
     xlab = 'Global Active Power (kilowatts)')
dev.off()

