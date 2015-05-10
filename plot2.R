#graph 2 
with(subData, {
    png("plot2.png",width=480,height=480)
    dateTime<-strptime(paste(subData$Date,subData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
    dateTime<-as.POSIXct(dateTime)
    globalActivePower<-as.numeric(subData$Global_active_power)
    plot(globalActivePower~dateTime,type="line",xlab="",ylab="Global Active Power (kW)")
    dev.off()
})
