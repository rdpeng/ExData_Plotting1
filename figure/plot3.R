
hpc <- read.csv('household_power_consumption.txt', na.strings = '?', sep=';', colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric' ), skip = 66637, nrows = 2880)

colnames(hpc) = c ('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')

hpc$datetime <- strptime(paste(hpc$Date, hpc$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")   

# plot 3
png(file='plot3.png')

with(hpc, 
     {
       plot( datetime, Sub_metering_1, type='l', xlab = '', col='black', ylab='Energy Sub Metering')
       points( datetime, Sub_metering_2, type='l', xlab = '', col='red' )
       points( datetime, Sub_metering_3, type='l', xlab = '', col='blue')
     }
)
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lwd = 2, lty = 1, cex=0.8)

dev.off()


