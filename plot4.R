Sys.setlocale("LC_TIME","eng")
library(dplyr)
# missing values are coded as "?"
original <- read.table('household_power_consumption.txt', sep=';', header = T)

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
## One alternative is to read the data from just those dates rather than
## reading in the entire dataset and subsetting to those dates.


original$Date <- as.Date(original$Date, '%d/%m/%Y')

febone <- unclass(as.Date('2007-02-01'))
febsec <- unclass(as.Date('2007-02-02'))
filtered<- subset(original, unclass(original$Date) %in% c(febone,febsec))

filtered$DateTime <- paste(filtered$Date, filtered$Time)
filtered$DateTime <- strptime(filtered$DateTime, '%Y-%m-%d %T', tz='UTC')




# plot and output to graphic file device

png(file = 'plot4.png', width = 480, height = 480)
par(fin = c(480*1/96, 480*1/96), mar = c(3,4,2,1), mfrow= c(2,2)) # par accepts inches - 1/96 inch = 1 pixel

# Number 1
y <- as.numeric(as.vector(filtered$Global_active_power)) 
x <- filtered$DateTime
plot(x, y, type = 'l', ylab= "Global Active Power (kilowatts)")

# NUMBER 2

y <- as.numeric(as.vector(filtered$Voltage))
x <- filtered$DateTime
plot(x, y, type = 'l', ylab= "Voltage", xlab= "datetime")


# NUMBER 3
a <- as.numeric(as.vector(filtered$Sub_metering_1))
b <- as.numeric(as.vector(filtered$Sub_metering_2))
c <- as.numeric(as.vector(filtered$Sub_metering_3))
x <- filtered$DateTime
plot(x, a, type = 'n', ylab= "Energy sub metering", )
lines(x, a, type = 'l', col = 'black')
lines(x, b, type = 'l', col = 'red')
lines(x, c, type = 'l', col = 'blue')
legend('topright', lty = c(1,1), col = c('black','red','blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), cex = 0.6)


# Number 4

y <- as.numeric(as.vector(filtered$Global_reactive_power))
x <- filtered$DateTime
plot(x, y, type = 'l', ylab= "Global_reactive_power", xlab= "datetime")

dev.off()
