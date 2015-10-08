# Assume that all the data needed for this plot is stored in pCons data frame.
# All the '?' were changed to NA's, all the date variables changed to class 'POSIXt' and all the
# other variables converted to numeric.

# Open png device to write in.
png(filename='plot3.png', width=480, height=480, units='px')
# Create plot.
plot(pCons$DateTime, pCons$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', main = '', type = 'l')
lines(pCons$DateTime, pCons$Sub_metering_2, col = 'red')
lines(pCons$DateTime, pCons$Sub_metering_3, col = 'blue')
legend('topright', legend =c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)
# Shut down the png device.
dev.off()