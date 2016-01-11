

### Reading and preparing data
hpc <- read.csv('household_power_consumption.txt', na.strings = '?', sep=';', colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric' ), skip = 66637, nrows = 2880)

colnames(hpc) = c ('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')

hpc$datetime <- strptime(paste(hpc$Date, hpc$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")   

# plot 2
par(pty='s')
png(file='plot2.png')
with(hpc, plot(datetime, Global_active_power, type='l', xlab = '', ylab='Global Active Power (Kws)'))
dev.off()

