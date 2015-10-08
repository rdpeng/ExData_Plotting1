# Assume that all the data needed for this plot is stored in pCons data frame.
# All the '?' were changed to NA's, all the date variables changed to class 'POSIXt' and all the
# other variables converted to numeric.

# Open png device to write in.
png(filename='plot1.png', width=480, height=480, units='px')
# Create histogram.
hist(pCons$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
# Shut down the png device.
dev.off()