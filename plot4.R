# Import libraries
library('dplyr')
# Check if there's need to download the dataset, download if necessary
if (!file.exists('household_power_consumption.txt')) {
        download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'dataset.zip')
        unzip('dataset.zip')
        unlink('dataset.zip')
}

# Read dataset, filter the required dates and convert to date format
ds <- read.csv2('household_power_consumption.txt', na.strings = '?', dec = '.') %>%
        filter(grepl('^[12]/2/2007$', Date))
ds$DateTime <- strptime(paste(ds$Date, ds$Time), format='%d/%m/%Y %H:%M:%S')

## Plotting the multi-plot for exercise 4
par(mfrow=c(2,2), mar=c(2.5,4,0.5,0.5), pch='.')

# Sub-plot 1
plot(ds$DateTime, ds$Global_active_power, main='', ylab='Global Active Power', xlab='')
lines(ds$DateTime, ds$Global_active_power)
# Sub-plot 2
plot(ds$DateTime, ds$Voltage, main='', ylab='Voltage', xlab='')
lines(ds$DateTime, ds$Voltage)
# Sub-plot 3
plot(ds$DateTime, ds$Sub_metering_1, main='', ylab='Energy Sub Metering', xlab='')
lines(ds$DateTime, ds$Sub_metering_1)
lines(ds$DateTime, ds$Sub_metering_2, col='red')
lines(ds$DateTime, ds$Sub_metering_3, col='blue')
legend('topright', legend=c('submeter1', 'submeter2', 'submeter3'), col=c('black', 'red', 'blue'), bty='n', xjust=0, y.intersp=0.8, lty=1, seg.len=1, cex=0.6)
# Sub-plot 4
plot(ds$DateTime, ds$Global_reactive_power, main='', ylab='Global Reactive Power', xlab='')
lines(ds$DateTime, ds$Global_reactive_power)
# File output and reset mfrow
dev.copy(device=png, width=480, height=480, filename='Plot4.png')
dev.off()
par(mfrow=c(1,1))
