# Assume that all the data needed for this plot is stored in pCons data frame.
# All the '?' were changed to NA's, all the date variables changed to class 'POSIXt' and all the
# other variables converted to numeric.

# Open png device to write in.
png(filename='plot2.png', width=480, height=480, units='px')
# Create plot.
plot(pCons$DateTime, pCons$Global_active_power, xlab = '', ylab = 'Global active power (kilowatts)', main = '', type = 'l')
# Shut down the png device.
dev.off()