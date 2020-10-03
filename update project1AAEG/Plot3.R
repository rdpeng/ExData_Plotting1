
##sunconjuntos de datos

> powerplot1$Date<-as.Date(powerplot1$Date,format='%d/%m/%Y')
> head(powerplot1$Date)
> power1<-subset(powerplot1,Date%in%as.Date(c("2007-02-01","2007-02-02")))
> power1$DateTime=as.POSIXct(paste(power1$Date,power1$Time))
> power1$Global_active_power<-as.numeric(power1$Global_active_power)
> DateTime<-power1$DateTime

####plot3

png("plot3.png", width=480, height=480)
 plot(x=DateTime,y=power1$Sub_metering_1,xlab="",type="l",ylab="Energy sub metering")
lines(x=DateTime,y=power1$Sub_metering_2,col="red")
lines(x=DateTime,y=power1$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()