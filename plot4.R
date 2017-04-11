library(data.table)
library(lubridate)

# Load data  -------------------------------------------------------------------

tmp <- fread('household_power_consumption.txt', na.strings = "?")
tmp$Date <- dmy(tmp$Date)

powerCons <- tmp[Date >= '2007-02-01' & Date <='2007-02-02',]

# Add a datetime timestamp

DateTime <- as.POSIXlt(paste(powerCons$Date, powerCons$Time))


# Plot the graph ---------------------------------------------------------------


par(mfcol = c(2,2))

png('plot4.png', height = 480, width = 480)

# Number 1
plot(x = DateTime,
     y = powerCons$Global_active_power,
     ylab = 'Global Active Power (kilowatts)',
     type = 'n')
lines(x = DateTime,
      y = powerCons$Global_active_power)

#Number 2
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

# Number 3

plot(x = DateTime,
     y = powerCons$Voltage,
     xlab = 'datetime',
     ylab = 'Voltage',
     type = 'n')
lines(x = DateTime,
      y = powerCons$Voltage)

# NUmber 4

plot(x = DateTime,
     y = powerCons$Global_reactive_power,
     xlab = 'datetime',
     ylab = 'Global_reactive_power',
     type = 'n')
lines(x = DateTime,
      y = powerCons$Global_reactive_power)

dev.off()
