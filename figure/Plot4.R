###### PLOT 4
#### this script requires the functions 'get_data' and 'make_numeric' (see Plot1.R)

# prelims: getting data, and so forth
data=get_data()
data$DateTime=paste(as.character(data$Date),as.character(data$Time))
data$DateTime=strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
x=data$DateTime
y=make_numeric(data$Global_active_power)

# setting up the save file
setwd('/Users/jenniferli/Desktop/ExData_Plotting1/figure/')
png(filename='plot4.png')

#setting up the panels
par(mfrow=c(2,2))
# panel 1
plot(x,y,ylab='Global Active Power (kilowatts)',xlab='',type='l')

# panel 2
plot(x,make_numeric(data$Voltage),ylab='Voltage',xlab='datetime',type='l')

# panel 3
plot(x,make_numeric(data$Sub_metering_1),ylab='Energy sub metering',xlab='',yaxt='n',ylim=c(0,35),type='l',col='black')
lines(x,make_numeric(data$Sub_metering_2),col='red')
lines(x,make_numeric(data$Sub_metering_3),col='blue')
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'),lwd=1,bty='n')

# panel 4
plot(x,make_numeric(data$Global_reactive_power),yaxt='n',ylab='Global_reactive_power',xlab='datetime',type='l')
axis(side=2, at=seq(0.0,0.5,by=0.1),labels=c('0.0','0.1','0.2','0.3','0.4','0.5'))

dev.off()


