# ---------------------  Readind the file
if (!('data.table' %in% installed.packages())){install.packages('data.table')}
library(data.table)
dat=fread('household_power_consumption.txt',na.strings='?',colClasses='character')
dat$Date=as.POSIXct(paste(dat$Date,dat$Time),format='%d/%m/%Y %H:%M:%S')
dat$Time=NULL
dat=dat[dat$Date>=as.POSIXct('2007-02-01') & dat$Date<as.POSIXct('2007-02-03'),]
dat=data.frame(dat)
dat[,2:7]=lapply(dat[,2:7],'as.numeric')

# I did this to ensure that the week days will be shown in English
def_lang=Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME","English")


# ---------------------  plot 3
png(filename='plot3.png',width=480,height=480)
with(dat,plot(Date,Sub_metering_1,type='l',ylab='Global Active Power (kilowatts)',xlab=''))
with(dat,lines(Date,Sub_metering_2,col='red'))
with(dat,lines(Date,Sub_metering_3,col='blue'))
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ),col = c(1,2,3),lty=1)
dev.off()


# ---------------------  restore the language
Sys.setlocale("LC_TIME",def_lang)
