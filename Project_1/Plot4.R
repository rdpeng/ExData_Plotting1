dat<-read.csv("household_power_consumption.csv",
              sep=';',na='?',
              nrows=72000)
#Then I got the indexes for the desired dates:
idx=which(dat$Date=='1/2/2007'|dat$Date=='2/2/2007')
mydat<-dat[idx,]#final 2880/9 table

png('Plot4.png',width = 480, height = 480)

par(mfrow=c(2,2))

#4.1
x<-1:length(mydat$Global_active_power)
y<-mydat$Global_active_power
plot(x, y, type='n',xaxt='n',xlab=' ', ylab='Global Active Power')
lines(x, y)
tickmarks<-c(min(x),max(x)/2,max(x))
label<-c('Thu','Fri','Sat')
axis(1,at=tickmarks,label)

#4.2
x<-1:length(mydat$Global_active_power)
y2<-mydat$Voltage
plot(x, y2, type='n',xaxt='n',xlab='datetime', ylab='Voltage')
lines(x, y2)
tickmarks<-c(min(x),max(x)/2,max(x))
label<-c('Thu','Fri','Sat')
axis(1,at=tickmarks,label)

#4.3
x<-1:length(mydat$Global_active_power)
y3<-mydat$Sub_metering_1

plot(x, y3, type='n',xaxt='n',xlab=' ',
     ylab='Energy sub metering')
tickmarks<-c(min(x),max(x)/2,max(x))
label<-c('Thu','Fri','Sat')
axis(1,at=tickmarks,label)

lines(x,y3)
lines(x,mydat$Sub_metering_2, col='red')
lines(x,mydat$Sub_metering_3, col='blue')

legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       lty=c(1,1,1),bty='n',
       col=c('black','red','blue'))

#4.4
x<-1:length(mydat$Global_reactive_power)
y4<-mydat$Global_reactive_power
plot(x, y4, type='n',xaxt='n',xlab='datetime', 
     ylab='Global_reactive_power')
lines(x, y4)
tickmarks<-c(min(x),max(x)/2,max(x))
label<-c('Thu','Fri','Sat')
axis(1,at=tickmarks,label)

dev.off()

