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

## Plot 3: Scatter plot of 'DateTime' vs. 3 'Energy sub metering's
png(file="plot3.png",
    width=480, height=480)

with (dataset, {
        plot(DateTime, Sub_metering_1,
             type = 'l',
             xlab = '',
             ylab = 'Energy sub metering')
        lines(DateTime, Sub_metering_2, col = 'red')
        lines(DateTime, Sub_metering_3, col = 'blue')
})
legend ('topright',
        c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
        lty = 'solid',
        col = c('black','red','blue'))

dev.off()