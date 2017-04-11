library(data.table)
library(lubridate)

# Load data  -------------------------------------------------------------------

tmp <- fread('household_power_consumption.txt', na.strings = "?")
tmp$Date <- dmy(tmp$Date)

powerCons <- tmp[Date >= '2007-02-01' & Date <='2007-02-02',]

# Add a datetime timestamp

DateTime <- as.POSIXlt(paste(powerCons$Date, powerCons$Time))


# Plot the graph ---------------------------------------------------------------

png('plot3.png', height = 480, width = 480)
plot(x = DateTime,
     y = powerCons$Sub_metering_1,
     ylab = 'Energy sub metering',
     type = 'n')
lines(x = DateTime,
      y = powerCons$Sub_metering_1,
      col = 'black')
lines(x = DateTime,
      y = powerCons$Sub_metering_2,
      col = 'red')
lines(x = DateTime,
      y = powerCons$Sub_metering_3,
      col = 'blue')
legend("topright",
       col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lwd = 1)
dev.off()


