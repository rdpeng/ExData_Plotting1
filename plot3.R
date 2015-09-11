hcpData <- read.table('household_power_consumption.txt',
                      header = TRUE,
                      sep = ';',
                      na.strings = '?')

hcpData <- hcpData[hcpData$Date == '1/2/2007' | hcpData$Date == '2/2/2007', ]

require(grDevices)

png('plot3.png', width = 480, height = 480)

datetime <- strptime(paste(hcpData$Date, hcpData$Time), '%d/%m/%Y %H:%M:%S')

plot(x = datetime,
     y = hcpData$Sub_metering_1,
     type = 'l',
     xlab = '',
     ylab = 'Energy sub metering',
     xaxt = 'n')

lines(x = datetime,
      y = hcpData$Sub_metering_2,
      col = 'red')

lines(x = datetime,
      y = hcpData$Sub_metering_3,
      col = 'blue')

axis(1,
     at = c(as.POSIXct('2007-02-01'), as.POSIXct('2007-02-02'), as.POSIXct('2007-02-03')),
     labels = c('Thu', 'Fri', 'Sat'))

legend(x = 'topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty = 1,
       col = c('black', 'red', 'blue'))

dev.off()