

### Reading and preparing data
hpc <- read.csv('household_power_consumption.txt', na.strings = '?', sep=';', colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric' ) ) 

hpc$Date = as.Date(hpc$Date, format='%d/%m/%Y')

colnames(hpc) = c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')

hpc = subset(hpc, Date == '2007-02-01' | Date == '2007-02-02')

# weekdays
wd <- unique(weekdays(as.Date(hpc$Date,'%d-%m-%Y'), abbreviate = TRUE))
wd <- c(wd, weekdays(as.Date(tail(hpc$Date,1)+1,'%d-%m-%Y'),abbreviate = TRUE))

# plot 1
par(pty='s')
png(file='plot1.png', width = 480, height = 480, units = 'px')
hist(hpc$Global_active_power, main='Global Active Power', col='red', xlab='Global Active Power (Kws)')
dev.off()
