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

## Plotting the histogram for exercise 1
hist(ds$Global_active_power, col='red', main='Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.copy(device=png, width=480, height=480, filename='Plot1.png')
dev.off()
