da<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
#x as time
da[,1]<-as.Date(da[,1],format="%d/%m/%Y")
x<- paste(da[da$Date=="2007-2-1"|da$Date=="2007-2-2",1], da[da$Date=="2007-2-1"|da$Date=="2007-2-2",2])
x<-strptime(x,format="%Y-%m-%d %H:%M:%S")
sub1<-da[da$Date=="2007-2-1"|da$Date=="2007-2-2",7]
sub2<-da[da$Date=="2007-2-1"|da$Date=="2007-2-2",8]
sub3<-da[da$Date=="2007-2-1"|da$Date=="2007-2-2",9]
weekdays(x)
png(file = "plot3.png",width = 480, height = 480, units = "px")
with(da,plot(x,as.numeric(as.character(sub1)),type="l",xlab="",ylab="Energy sub metering") )
with(da,points(x,as.numeric(as.character(sub2)),type="l",xlab="",col="red"))
with(da,points(x,as.numeric(as.character(sub3)),type="l",xlab="",col="blue"))
legend("topright", pch ="__", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
