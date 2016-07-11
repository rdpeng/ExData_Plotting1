plot3<-function(){
    alldata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
    datesub<-alldata[alldata$Date %in% c("1/2/2007","2/2/2007"),]
    datesub$Date<-as.Date(datesub$Date,format = "%d/%m/%Y")
    datesub<-transform(datesub, daytime = paste(datesub$Date,datesub$Time))
    datesub$daytime<-as.POSIXct(strptime(datesub$daytime,"%Y-%m-%d %H:%M:%S",tz = ""))
    with(datesub,plot(daytime,Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab = " "))
    with(datesub,lines(daytime,Sub_metering_1,col = "Black",type = "l"))
    with(datesub,lines(daytime,Sub_metering_2,col = "Red",type = "l"))
    with(datesub,lines(daytime,Sub_metering_3,col = "Blue",type = "l"))
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col = c("Black","Red","Blue"),bty = "n",cex = 0.75)
    dev.copy(png,file = "plot3.png",width = 480,height = 480, units = "px")
}