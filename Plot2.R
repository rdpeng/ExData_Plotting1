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

#plot2
with(elec,plot(Time,Global_active_power, type="l", main="Kilowatt usage", xlab="Time", ylab="Global active power (kilowatts)",labels=F))
x<-c(as.POSIXlt("2007-02-01 00:00:00"),as.POSIXlt("2007-02-02 00:00:00"),as.POSIXlt("2007-02-02 23:59:00"))# this will be one second wrong
axis.POSIXct(1,at=x,labels=c("Thur","Fri","Sat"))
dev.copy(png, file = "Plot2.png") ## Copy my plot to a PNG file
dev.off() 
