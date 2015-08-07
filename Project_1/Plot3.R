dat<-read.csv("household_power_consumption.csv",
              sep=';',na='?',
              nrows=72000)
#Then I got the indexes for the desired dates:
idx=which(dat$Date=='1/2/2007'|dat$Date=='2/2/2007')
mydat<-dat[idx,]#final 2880/9 table

png('Plot3.png',width = 480, height = 480)

x<-1:length(mydat$Global_active_power)
y<-mydat$Sub_metering_1

plot(x, y, type='n',xaxt='n',xlab=' ',
     ylab='Energy sub metering')
tickmarks<-c(min(x),max(x)/2,max(x))
label<-c('Thu','Fri','Sat')
axis(1,at=tickmarks,label)

lines(x,y)
lines(x,mydat$Sub_metering_2, col='red')
lines(x,mydat$Sub_metering_3, col='blue')

legend('topright',c('Sub_metering_1','Sub_metering_2',
                    'Sub_metering_3'), lty=c(1,1,1),
       col=c('black','red','blue'))

dev.off()