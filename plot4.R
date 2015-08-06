dt<-read.table(file="data/household_power_consumption.txt",header=TRUE,sep=";"
               ,colClasses=(c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
               ,nrows=2075259,na.strings=c("?",""))
#install.packages("lubridate")
require("lubridate")
datetime<-parse_date_time(paste(dt$Date,dt$Time),"dmyhms",tz="UTC",truncated=3)
dt<-cbind(datetime,dt[,3:9])
rm(datetime)
feb2days<-dt[dt$datetime>=strptime("02/01/2007 00:00:00","%m/%d/%Y %H:%M:%S",tz="UTC") 
             & dt$datetime<strptime("02/03/2007 00:00:00","%m/%d/%Y %H:%M:%S",tz="UTC"),]
png(filename = "plot4.png",width=480,height=480,type="windows",pointsize = 10)
par(mfcol=c(2,2))
with(feb2days
     ,plot(Global_active_power~datetime,type="l",xlab=NA,ylab="Global Active Power")
)
with(feb2days
     ,plot(Sub_metering_1~datetime,type="l",xlab=NA,ylab="Energy sub metering")
)
with(feb2days
     ,points(Sub_metering_2~datetime,type="l",col="red")
)
with(feb2days
     ,points(Sub_metering_3~datetime,type="l",col="blue")
)
legend("topright",lty=1,lwd=1,col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_1","Sub_metering_1"))
with(feb2days,plot(Voltage~datetime,type="l"))
with(feb2days,plot(Global_reactive_power~datetime,type="l"))
dev.off()
