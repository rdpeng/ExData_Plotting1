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

## Plotting the line chart for exercise 3
par(pch='.')
plot(ds$DateTime, ds$Sub_metering_1, main='', ylab='Energy Sub Metering', xlab='')
lines(ds$DateTime, ds$Sub_metering_1)
lines(ds$DateTime, ds$Sub_metering_2, col='red')
lines(ds$DateTime, ds$Sub_metering_3, col='blue')
legend('topright', legend=c('sub_metering_1', 'sub_metering_2', 'sub_metering_3'), col=c('black', 'red', 'blue'), lwd=1, cex=0.7)
dev.copy(device=png, width=480, height=480, filename='Plot3.png')
dev.off()