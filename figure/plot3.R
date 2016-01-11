

### Reading and preparing data
hpc <- read.csv('household_power_consumption.txt', na.strings = '?', sep=';', colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric' ) ) 

hpc$Date = as.Date(hpc$Date, format='%d/%m/%Y')

colnames(hpc) = c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')

hpc = subset(hpc, Date == '2007-02-01' | Date == '2007-02-02')

# weekdays
wd <- unique(weekdays(as.Date(hpc$Date,'%d-%m-%Y'), abbreviate = TRUE))
wd <- c(wd, weekdays(as.Date(tail(hpc$Date,1)+1,'%d-%m-%Y'),abbreviate = TRUE))
     
# plot 3
par(pty='s')

png(file='plot3.png', width = 480, height = 480, units = 'px')

plot( seq(1,length(hpc$Global_active_power)), hpc$Sub_metering_1, type='l', xlab = '', col='black', xaxt='n', ylab='Energy Sub Metering')
points( seq(1,length(hpc$Global_active_power)), hpc$Sub_metering_2, type='l', xlab = '', col='red', xaxt='n')
points( seq(1,length(hpc$Global_active_power)), hpc$Sub_metering_3, type='l', xlab = '', col='blue',xaxt='n')
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty = 1, cex=0.8)
axis (1, at = c(0,length(hpc$Date)/2,length(hpc$Date)), labels=wd) 

dev.off()


