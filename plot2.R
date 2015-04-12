library(lubridate)
library(dplyr)

##reading data from working directory
p<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

##reshaping data
p$Date<-dmy(p$Date)
ed<-ydm("2007/02/02")
sd<-ydm("2007/01/02")
p<-filter(p,Date==sd|Date==ed)
t<-(1:length(p[,2]))
p<-mutate(p,t=(1:length(p[,2])))

##plot2:
with(p,plot(t,Global_active_power,frame=TRUE,axes=FALSE,xlab="",ylab="Global Active Power (kilowatts)",type="n"))
lines(t,p$Global_active_power)
axis(1,c(min(p$t),median(p$t),max(p$t)),c("Thu","Fri","Sat"),lwd=2)
axis(2,c(0,2,4,6),lwd=2)
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()

