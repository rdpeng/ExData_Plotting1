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

## Plotting the line chart for exercise 2
par(pch='.')
plot(ds$DateTime, ds$Global_active_power, main='', ylab='Global Active Power (kilowatts)', xlab='')
lines(ds$DateTime, ds$Global_active_power)
dev.copy(device=png, width=480, height=480, filename='Plot2.png')
dev.off()