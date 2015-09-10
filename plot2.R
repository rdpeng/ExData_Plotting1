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
png(filename = "plot2.png",width=480,height=480,type="windows",pointsize = 10)
with(feb2days
     ,plot(Global_active_power~datetime,type="l",xlab=NA,ylab="Global Active Power(kilowatts)")
)
dev.off()
