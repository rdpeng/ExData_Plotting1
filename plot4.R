# Assume that all the data needed for this plot is stored in pCons data frame.
# All the '?' were changed to NA's, all the date variables changed to class 'POSIXt' and all the
# other variables converted to numeric.

# Open png device to write in.
png(filename='plot4.png', width=480, height=480, units='px')
# Create plot.
par(mfrow=c(2,2))
plot(pCons$DateTime, pCons$Global_active_power, xlab = '', ylab = 'Global active power (kilowatts)', main = '', type = 'l')
plot(pCons$DateTime, pCons$Voltage, xlab='datetime',ylab='Voltage', type='l')
plot(pCons$DateTime, pCons$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', main = '', type = 'l')
lines(pCons$DateTime, pCons$Sub_metering_2, col = 'red')
lines(pCons$DateTime, pCons$Sub_metering_3, col = 'blue')
legend('topright', legend =c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)
plot(pCons$DateTime, pCons$Global_reactive_power, xlab='datetime',ylab='Global_reactive_power', type='l')
# Shut down the png device.
dev.off()