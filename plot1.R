hcpData <- read.table('household_power_consumption.txt',
                      header = TRUE,
                      sep = ';',
                      na.strings = '?')

hcpData <- hcpData[hcpData$Date == '1/2/2007' | hcpData$Date == '2/2/2007', ]

require(grDevices)

png('plot1.png', width = 480, height = 480)

hist(hcpData$Global_active_power,
     breaks = seq(0,12,0.5),
     col = 'red',
     xlim = c(0, 8),
     ylim = c(0, 1200),
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency',
     xaxt='n',
     yaxt='n')

axis(1, at = seq(0, 6, 2), labels = seq(0, 6, 2))

axis(2, at = seq(0, 1200, 200), labels = seq(0, 1200, 200))

dev.off()