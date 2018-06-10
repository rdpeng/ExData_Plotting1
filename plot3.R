file<-read.table(file='household_power_consumption.txt',sep = ';',header = T,na.strings = '?')
file$D=as.Date(file$Date,format='%d/%m/%Y')
file<-subset(file,file$D=='2007-02-01'|file$D=='2007-02-02')
file$D=as.Date(file$Date,format='%d/%m/%Y')
file$DT=strptime(paste(file$Date,file$Time,sep = '/'),format='%d/%m/%Y/%H:%M:%S')

par(mfrow=c(1,1),mar=c(4,4,2,2))
plot(file$DT,file$Sub_metering_1,type='l',ylab='Energy sub metering',xlab='\n')
lines(file$DT,file$Sub_metering_2,col='red')
lines(file$DT,file$Sub_metering_3,col='blue')
legend('topright',lwd=c(1,1,1),col=c('black','red','blue'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()