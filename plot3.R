Sys.setlocale("LC_TIME","eng")
original <- read.table('household_power_consumption.txt', sep=';', header = T)
par(fin = c(480*1/96, 480*1/96), mar = c(3,4,2,1)) # par accepts inches - 1/96 inch = 1 pixel

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
## One alternative is to read the data from just those dates rather than
## reading in the entire dataset and subsetting to those dates.


original$Date <- as.Date(original$Date, '%d/%m/%Y')

febone <- unclass(as.Date('2007-02-01'))
febsec <- unclass(as.Date('2007-02-02'))
filtered<- subset(original, unclass(original$Date) %in% c(febone,febsec))
filtered$DateTime <- paste(filtered$Date, filtered$Time)
filtered$DateTime <- strptime(filtered$DateTime, '%Y-%m-%d %T', tz='UTC')
a <- as.numeric(as.vector(filtered$Sub_metering_1))
b <- as.numeric(as.vector(filtered$Sub_metering_2))
c <- as.numeric(as.vector(filtered$Sub_metering_3))

x <- filtered$DateTime


# plot and output to graphic file device

png(file = 'plot3.png', width = 480, height = 480)
plot(x, a, type = 'n', ylab= "Energy sub metering", xlab = NA)
lines(x, a, type = 'l', col = 'black')
lines(x, b, type = 'l', col = 'red')
lines(x, c, type = 'l', col = 'blue')
legend('topright', lty = c(1,1), col = c('black','red','blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), cex = 1.0)

dev.off()
