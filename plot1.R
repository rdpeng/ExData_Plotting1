file<-read.table(file='household_power_consumption.txt',sep = ';',header = T,na.strings = '?')
file$D=as.Date(file$Date,format='%d/%m/%Y')
file<-subset(file,file$D=='2007-02-01'|file$D=='2007-02-02')

par(mfrow=c(1,1),mar=c(4,4,2,2))
hist(file$Global_active_power,col='red',xlab='Global Active Power(killowatts)',xlim=c(0,6),main = 'Global Active Power')
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()