file<-read.table(file='household_power_consumption.txt',sep = ';',header = T,na.strings = '?')
file$D=as.Date(file$Date,format='%d/%m/%Y')
file<-subset(file,file$D=='2007-02-01'|file$D=='2007-02-02')
file$D=as.Date(file$Date,format='%d/%m/%Y')
file$DT=strptime(paste(file$Date,file$Time,sep = '/'),format='%d/%m/%Y/%H:%M:%S')

par(mfrow=c(2,2),mar=c(4,4,2,2))
with(file,{
  plot(DT,Global_active_power,type='l')
  plot(DT,Voltage,type = 'l',ylab='Vottage',xlab = 'datetime')
  {plot(file$DT,file$Sub_metering_1,type='l',ylab='Energy sub metering',xlab='\n')
    lines(file$DT,file$Sub_metering_2,col='red')
    lines(file$DT,file$Sub_metering_3,col='blue')
    legend('topright',cex=0.6,lwd=c(1,1,1),lty=1,bty="n",col=c('black','red','blue'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
  }  
  plot(DT,Global_reactive_power,type = 'l',xlab='datetime')
})

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()