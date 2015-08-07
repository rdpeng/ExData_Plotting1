dat<-read.csv("household_power_consumption.csv",
              sep=';',na='?',
              nrows=72000)
#Then I got the indexes for the desired dates:
idx=which(dat$Date=='1/2/2007'|dat$Date=='2/2/2007')
mydat<-dat[idx,]#final 2880/9 table

#I struggled with this one; I realize that there is probably 
#a better way to construct it, but since we know 
#as much as we do about the dataset 
#I made my life easier in some places:

png('Plot2.png',width = 480, height = 480)

x<-1:length(mydat$Global_active_power)
y<-mydat$Global_active_power

plot(x, y, type='n',xaxt='n',xlab=' ',
     ylab='Global Active Power (kilowatts)')
lines(x, y)
tickmarks<-c(min(x),max(x)/2,max(x))
label<-c('Thu','Fri','Sat')
axis(1,at=tickmarks,labels=label)

dev.off()