
# Load File

data<-read.table('household_power_consumption.txt',sep=';',head=TRUE,na.string=c('NA','?'))

# Data Preparation

data$Time<-paste(data$Date,data$Time)
data$Time<-strptime(data$Time,format='%d/%m/%Y %H:%M:%S')
data$Date<-as.Date(data$Date,format='%d/%m/%Y')

# Row 66637=397+((15+31)*24*60) to 69516=66637+2879(=24*60*2)

dataPLOT<-data[66637:69516,]

# Graph

png('plot4.png',width=480,height=480)
par(mfrow=c(2,2))

# First Row of Graph

plot(dataPLOT$Time,dataPLOT$Global_active_power,ylab='Global Active Power',type='solid',xlab='')
plot(dataPLOT$Time,dataPLOT$Voltage,xlab='datatime',ylab='Voltage',type='solid')

# Second Row of Graph

plot(dataPLOT$Time,dataPLOT$Sub_metering_1,ylab='Global Active Power',type='solid',xlab='',ylim=range(0,38))
par(new=T)
plot(dataPLOT$Time,dataPLOT$Sub_metering_2,ylab='Global Active Power',type='solid',xlab='',ylim=range(0,38),col='red')
par(new=T)
plot(dataPLOT$Time,dataPLOT$Sub_metering_3,ylab='Global Active Power',type='solid',xlab='',ylim=range(0,38),col='blue')
labels<-c('Sub_setting_1','Sub_setting_2','Sub_setting_3')
legend('topright',labels,lwd=2,col=c('black','red','blue'))

plot(dataPLOT$Time,dataPLOT$Global_reactive_power,xlab='datatime',ylab='Global_reactive_power',type='solid',ylim=range(0,0.5))

dev.off()