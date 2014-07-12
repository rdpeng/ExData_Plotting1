# I did this to ensure that the week days will be shown in English
def_lang=Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME","English")

# ---------------------  Readind the file
if (!('data.table' %in% installed.packages())){install.packages('data.table')}
library(data.table)
dat=fread('household_power_consumption.txt',na.strings='?',colClasses='character')
dat$Date=as.POSIXct(paste(dat$Date,dat$Time),format='%d/%m/%Y %H:%M:%S')
dat$Time=NULL
dat=dat[dat$Date>=as.POSIXct('2007-02-01') & dat$Date<as.POSIXct('2007-02-03'),]
dat=data.frame(dat)
dat[,2:7]=lapply(dat[,2:7],'as.numeric')

# ---------------------  plot 4
png(filename='plot4.png',width=480,height=480)
par(mfrow=c(2,2))
with(dat,plot(Date,Global_active_power,type='l',ylab='Global Active Power',xlab=''))
with(dat,plot(Date,Voltage,type='l',ylab='Voltage',xlab='datetime'))
with(dat,plot(Date,Sub_metering_1,type='l',ylab='Global Active Power (kilowats)',xlab=''))
with(dat,lines(Date,Sub_metering_2,col='red'))
with(dat,lines(Date,Sub_metering_3,col='blue'))
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ),col = c(1,2,3),lty=1)
with(dat,plot(Date,Global_reactive_power,type='l',ylab='Global_Reactive_Power',xlab='datetime'))
dev.off()

# ---------------------  restore the language
Sys.setlocale("LC_TIME",def_lang)
