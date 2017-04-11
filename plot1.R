library(data.table)
library(lubridate)

# Load data  -------------------------------------------------------------------

tmp <- fread('household_power_consumption.txt', na.strings = "?")
tmp$Date <- dmy(tmp$Date)
tmp$Time <- hms(tmp$Time)

powerCons <- tmp[Date >= '2007-02-01' & Date <='2007-02-02',]

# Plot the graph ---------------------------------------------------------------

png(filename = 'plot1.png', width = 480, height = 480)
with(powerCons, hist(x = Global_active_power,
                     xlab = 'Global Active Power (kilowatts)',
                     ylab = 'Frequency',
                     col = 'red',
                     main = 'Global Active Power'))
dev.off()
