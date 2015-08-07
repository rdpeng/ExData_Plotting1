dat<-read.csv("household_power_consumption.csv",
              sep=';',na='?',
              nrows=72000)
#Then I got the indexes for the desired dates:
idx=which(dat$Date=='1/2/2007'|dat$Date=='2/2/2007')
mydat<-dat[idx,]#final 2880/9 table

png('Plot1.png',width = 480, height = 480)

###Plot_1###
hist(mydat$Global_active_power,12, col='red',
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)',
     ylab='Frequency')

dev.off()