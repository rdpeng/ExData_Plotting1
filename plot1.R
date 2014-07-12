# ---------------------  Readind the file 
if (!('data.table' %in% installed.packages())){install.packages('data.table')}
library(data.table)
dat=fread('household_power_consumption.txt',na.strings='?',colClasses='character')
dat$Date=as.POSIXct(paste(dat$Date,dat$Time),format='%d/%m/%Y %H:%M:%S')
dat$Time=NULL
dat=dat[dat$Date>=as.POSIXct('2007-02-01') & dat$Date<as.POSIXct('2007-02-03'),]
dat=data.frame(dat)
dat[,2:7]=lapply(dat[,2:7],'as.numeric')

# ---------------------  plot 1
png(filename='plot1.png',width=480,height=480)
hist(as.numeric(dat$Global_active_power),col='red',main='Global Active Power',
     xlab='Global Active Power (kilowatts)')
dev.off()