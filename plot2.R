hcpData <- read.table('household_power_consumption.txt',
                      header = TRUE,
                      sep = ';',
                      na.strings = '?')

hcpData <- hcpData[hcpData$Date == '1/2/2007' | hcpData$Date == '2/2/2007', ]

require(grDevices)

png('plot2.png', width = 480, height = 480)

plot(x = strptime(paste(hcpData$Date, hcpData$Time), '%d/%m/%Y %H:%M:%S'),
     y = hcpData$Global_active_power,
     type = 'l',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)',
     xaxt = 'n',
     yaxt = 'n')

axis(1,
     at = c(as.POSIXct('2007-02-01'), as.POSIXct('2007-02-02'), as.POSIXct('2007-02-03')),
     labels = c('Thu', 'Fri', 'Sat'))

axis(2,
     at = seq(0, 6, 2),
     labels = seq(0, 6, 2))

dev.off()