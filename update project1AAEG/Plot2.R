####Plot2

> png("Plot2.png",width=480, height=480)
> plot(powerplot1$Globalactive, type="l", ylab="Global Active Power (Kilowatts)", xlab="Day",axes=F)
> axis(side=1, at=c(1,1440,2880), labels=c("Thu","Fry","Sat"))
> axis(side=2, at=c(0,2,4,6), labels=c("0","2","4","6"))
> dev.off()
