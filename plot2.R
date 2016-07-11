plot2<-function(){
    alldata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
    datesub<-alldata[alldata$Date %in% c("1/2/2007","2/2/2007"),]
    datesub$Date<-as.Date(datesub$Date,format = "%d/%m/%Y")
    datesub<-transform(datesub, daytime = paste(datesub$Date,datesub$Time))
    datesub$daytime<-as.POSIXct(strptime(datesub$daytime,"%Y-%m-%d %H:%M:%S",tz = ""))
    plot(datesub$daytime,datesub$Global_active_power,type = "l",xlab = " ",ylab = "Global Active Power (kilowatts)")
    dev.copy(png,file = "plot2.png",width = 480,height = 480, units = "px")
}