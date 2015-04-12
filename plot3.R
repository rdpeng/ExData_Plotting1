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
p$Sub_metering_1<-as.numeric(as.character(p$Sub_metering_1))
p$Sub_metering_2<-as.numeric(as.character(p$Sub_metering_2))
p$Sub_metering_3<-as.numeric(as.character(p$Sub_metering_3))

##plot3:
with(p,plot(t,Sub_metering_1,type="l",frame=T,axes=F,xlab="",ylab="Energy sub metering"))
with(subset(p),points(t,Sub_metering_2,type="l",col="red"))
with(subset(p),points(t,Sub_metering_3,type="l",col="blue"))

axis(1,c(min(p$t),median(p$t),max(p$t)),c("Thu","Fri","Sat"),lwd=2)
axis(2,seq(0,30,by=10),lwd=2)

legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.6)

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()


