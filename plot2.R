library(data.table)
library(lubridate)

# Load data  -------------------------------------------------------------------

tmp <- fread('household_power_consumption.txt', na.strings = "?")
tmp$Date <- dmy(tmp$Date)

powerCons <- tmp[Date >= '2007-02-01' & Date <='2007-02-02',]

# Add a datetime timestamp

DateTime <- as.POSIXlt(paste(powerCons$Date, powerCons$Time))


# Plot the graph ---------------------------------------------------------------

png('plot2.png', height = 480, width = 480)
plot(x = DateTime,
     y = powerCons$Global_active_power,
     ylab = 'Global Active Power (kilowatts)',
     type = 'n')
lines(x = DateTime,
      y = powerCons$Global_active_power)
dev.off()
