
# Load File

data<-read.table('household_power_consumption.txt',sep=';',head=TRUE,na.string=c('NA','?'))

# Data Preparation

data$Time<-paste(data$Date,data$Time)
data$Time<-strptime(data$Time,format='%d/%m/%Y %H:%M:%S')
data$Date<-as.Date(data$Date,format='%d/%m/%Y')

# Row 66637=397+((15+31)*24*60) to 69516=66637+2879(=24*60*2)

dataPLOT<-data[66637:69516,]

# Graph

png('plot3.png',width=480,height=480)
plot(dataPLOT$Time,dataPLOT$Sub_metering_1,type='solid',ylab='Energy sub metering',xlab='',ylim=range(0,38))
par(new=T)
plot(dataPLOT$Time,dataPLOT$Sub_metering_2,type='solid',ylab='Energy sub metering',xlab='',ylim=range(0,38),col='red')
par(new=T)
plot(dataPLOT$Time,dataPLOT$Sub_metering_3,type='solid',ylab='Energy sub metering',xlab='',ylim=range(0,38),col='blue')
labels<-c('Sub_setting_1','Sub_setting_2','Sub_setting_3')
legend('topright',labels,lwd=2,col=c('black','red','blue'))
dev.off()

