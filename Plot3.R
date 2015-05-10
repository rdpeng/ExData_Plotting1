setwd("C:/Users/Beatriz/Documents/Cursera")

colcls<-c("character","character",  "numeric","numeric","numeric","numeric","numeric","numeric","numeric")
elec<-read.table("household_power_consumption.txt",sep=";",header=T,
                 colClasses=colcls, na.strings="?")

elec<-elec[elec$Date=="1/2/2007"| elec$Date=="2/2/2007",]

t<-paste(elec$Date,elec$Time)
t<-strptime(t,"%d/%m/%Y %H:%M:%S")
elec$Time<-t
elec$Date<-as.Date(elec$Date,"%d/%m/%Y")
head(elec)

#plot3
with(elec,plot(Time, Sub_metering_1, type="l", col="black", ylab="Energy sub metering", labels=F))
with(elec,lines(Time, Sub_metering_2, type="l", col="red"))
with(elec,lines(Time, Sub_metering_3, type="l", col="blue"))
x<-c(as.POSIXlt("2007-02-01 00:00:00"),as.POSIXlt("2007-02-02 00:00:00"),as.POSIXlt("2007-02-02 23:59:00"))# this will be one second wrong
axis.POSIXct(1,at=x,labels=c("Thur","Fri","Sat"))
legend("top", lty = 1, bty="n", col = c("black", "red","blue"), legend = c("sub metering 1", "sub metering 2","sub metering 3"), cex=0.7)#cex used for changing label box size but does not work, relative to par(), 

dev.copy(png, file = "Plot3.png") ## Copy my plot to a PNG file
dev.off() 
