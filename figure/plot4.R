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

## Plot 4: Group scatter plots of :1.'DateTime' vs. 'Global Active Power';
## 2. 'DateTime' vs. 'Voltage'; 3.'DateTime' vs. 3 'Energy sub metering's;
## 4. 'DateTime' vs. 'Global reactive power'
png(file="plot4.png",
    width=480, height=480)

par(mfrow=c(2,2),mar=c(5,4,1,1))
with (dataset, {
        plot(DateTime, Global_active_power,
             type = 'l', xlab = '', ylab = 'Global Active Power')
        plot(DateTime, Voltage, 
             type = 'l', xlab = 'datetime', ylab = 'Voltage')
        plot(DateTime, Sub_metering_1,
             type = 'l', xlab = '', ylab = 'Energy sub metering')
        lines(DateTime, Sub_metering_2, col = 'red')
        lines(DateTime, Sub_metering_3, col = 'blue')
        legend ('topright',
                c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
                lty = 'solid', col = c('black','red','blue'))
        plot(DateTime, Global_reactive_power,
             type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')
})
dev.off()