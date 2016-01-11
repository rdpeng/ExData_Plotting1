

### Reading and preparing data
hpc <- read.csv('household_power_consumption.txt', na.strings = '?', sep=';', colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric' ) ) 

hpc$Date = as.Date(hpc$Date, format='%d/%m/%Y')

colnames(hpc) = c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')

hpc = subset(hpc, Date == '2007-02-01' | Date == '2007-02-02')

#library(chron)
#hpc$Time = chron(times = hpc$Time)

# weekdays
wd <- unique(weekdays(as.Date(hpc$Date,'%d-%m-%Y'), abbreviate = TRUE))
wd <- c(wd, weekdays(as.Date(tail(hpc$Date,1)+1,'%d-%m-%Y'),abbreviate = TRUE))
     
# plot 4 
png(file='plot4.png', width = 480, height = 480, units = 'px')

# plot 4.1
par(mfrow=c(2,2))

plot( seq(1,length(hpc$Global_active_power)), hpc$Global_active_power, type='l', xaxt='n', xlab = '', ylab='Global Active Power (Kws)') 
axis (1, at = c(0,length(hpc$Date)/2,length(hpc$Date)), labels=wd) 

# plot 4.2
plot( seq(1,length(hpc$Global_active_power)), hpc$Voltage, type='l', xlab = '', col='black', xaxt='n', ylab='Voltage')
axis (1, at = c(0,length(hpc$Date)/2,length(hpc$Date)), labels=wd) 
mtext('datetime', 1, line = 2.5, cex=0.8)

# plot 4.3
plot( seq(1,length(hpc$Global_active_power)), hpc$Sub_metering_1, type='l', xlab = '', col='black', xaxt='n', ylab='Energy Sub Metering')
points( seq(1,length(hpc$Global_active_power)), hpc$Sub_metering_2, type='l', xlab = '', col='red', xaxt='n')
points( seq(1,length(hpc$Global_active_power)), hpc$Sub_metering_3, type='l', xlab = '', col='blue',xaxt='n')
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty = 1, cex=0.7, box.col = 'white')
axis (1, at = c(0,length(hpc$Date)/2,length(hpc$Date)), labels=wd) 

# plot 4.4
plot( seq(1,length(hpc$Global_active_power)), hpc$Global_reactive_power, type='l', xlab = '', col='black', xaxt='n', ylab='Global_reactive_power')
axis (1, at = c(0,length(hpc$Date)/2,length(hpc$Date)), labels=wd) 
mtext('datetime', 1, line = 2.5, cex=0.8)

dev.off()


