da<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
#x as time
da[,1]<-as.Date(da[,1],format="%d/%m/%Y")
x<- paste(da[da$Date=="2007-2-1"|da$Date=="2007-2-2",1], da[da$Date=="2007-2-1"|da$Date=="2007-2-2",2])
x<-strptime(x,format="%Y-%m-%d %H:%M:%S")
temp<-da[da$Date=="2007-2-1"|da$Date=="2007-2-2",]
weekdays(x)
png(file = "plot2.png",width = 480, height = 480, units = "px")
with(temp, plot(x,as.numeric(as.character(temp[,3])),type="l",xlab="",ylab="Global Active Power(kilowatts)"))
dev.off()
