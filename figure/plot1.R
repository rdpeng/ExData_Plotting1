## set your own working directory
# setwd(dir='/Users/...')

## Suppose you already download the zip file 'household_power_consumption' and unzip it.

## Read the whole data and subset the useful part
dataset <- read.table("household_power_consumption.txt",
                      header = TRUE,
                      sep = ';',
                      na.strings = '?',
                      stringsAsFactors = FALSE)
dataset <- subset(dataset, Date %in% c('1/2/2007','2/2/2007'))

## Format new column 'DateTime' and remove old 'Date' and 'Time' columns
dataset$Date <- as.Date(dataset$Date, '%d/%m/%Y')
dataset$Date <- as.character(dataset$Date)
DateTime <- strptime(paste(dataset$Date, dataset$Time),
                     '%Y-%m-%d %H:%M:%S')
dataset <- cbind(DateTime,dataset)
dataset <- dataset[,!names(dataset) %in% c('Date','Time')]

## Plot 1: hitograme of 'Global Active Power' vs. its frequency
png(file="plot1.png",
    width=480, height=480)

with(dataset, {
        hist(Global_active_power,
             main = 'Global Active Power',
             xlab = 'Global Active Power (kilowatts)',
             col = 'red')
})
dev.off()