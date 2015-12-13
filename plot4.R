url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
filename <- 'dataset.zip'
f <- file.path(getwd(), filename)

if (!file.exists(filename)) {
  download.file(url, filename)
}

if (!file.exists('household_power_consumption.txt')) { 
  unzip(filename)
}

data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')

subset <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]

png('plot4.PNG', width = 480, height = 480)
par(mfrow = c(2,2))

plot(strptime(paste(subset$Date,subset$Time), '%d/%m/%Y %H:%M'), as.numeric(subset$Global_active_power), type = '1', xlab = '', ylab = 'Global Active Power', col = 'black')
plot(strptime(paste(subset$Date,subset$Time), '%d/%m/%Y %H:%M'), as.numeric(subset$Voltage), type = '1', xlab = 'datetime', ylab = 'Voltage', col = 'black')

plot(strptime(paste(subset$Date,subset$Time), '%d/%m/%Y %H:%M'), as.numeric(subset$Sub_metering_1), type = '1', xlab = 'datetime', ylab = 'Energy sub metering', col = 'black')
lines(strptime(paste(subset$Date,subset$Time), '%d/%m/%Y %H:%M'), as.numeric(subset$Sub_metering_2), type = '1', col = 'red')
lines(strptime(paste(subset$Date,subset$Time), '%d/%m/%Y %H:%M'), as.numeric(subset$Sub_metering_3), type = '1', col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, lwd = 2.5, col = c('black', 'red', 'blue'), bty = 'o')

plot(strptime(paste(subset$Date,subset$Time), '%d/%m/%Y %H:%M'), as.numeric(subset$Global_reactive_power), type = '1', xlab = 'datetime', ylab = 'Global_reactive_power', col = 'black')
dev.off()