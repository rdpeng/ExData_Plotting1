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


# ---------------------  plot 2
png(filename='plot2.png',width=480,height=480)
with(dat,plot(Date,Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab=''))
dev.off()



# ---------------------  restore the language
Sys.setlocale("LC_TIME",def_lang)
