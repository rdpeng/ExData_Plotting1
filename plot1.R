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

png('plot1.PNG', width = 480, height = 480)
hist(as.numeric(subset$Global_active_power), col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency')
dev.off()