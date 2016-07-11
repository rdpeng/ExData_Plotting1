plot4<-function(){
    alldata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
    datesub<-alldata[alldata$Date %in% c("1/2/2007","2/2/2007"),]
    datesub$Date<-as.Date(datesub$Date,format = "%d/%m/%Y")
    datesub<-transform(datesub, daytime = paste(datesub$Date,datesub$Time))
    datesub$daytime<-as.POSIXct(strptime(datesub$daytime,"%Y-%m-%d %H:%M:%S",tz = ""))
    par(mfrow = c(2,2))
    plot(datesub$daytime,datesub$Global_active_power,xlab = " ",ylab = "Global Active Power",type = "l")
    plot(datesub$daytime,datesub$Voltage,xlab = "datetime",ylab = "Voltage",type = "l")
    with(datesub,plot(daytime,Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab = " "))
    with(datesub,lines(daytime,Sub_metering_1,col = "Black",type = "l"))
    with(datesub,lines(daytime,Sub_metering_2,col = "Red",type = "l"))
    with(datesub,lines(daytime,Sub_metering_3,col = "Blue",type = "l"))
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col = c("Black","Red","Blue"),bty = "n",cex = 0.75,y.intersp = c(0.25,.25,.25),title.adj = 0)
    plot(datesub$daytime,datesub$Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type = "l")
    dev.copy(png,file = "plot4.png",width = 480,height = 480, units = "px")
}