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

#plot1
with(elec,hist(Global_active_power, breaks=12, col="red",main="Global_active_power", xlab="Global_active_power (kilowatts)"))
dev.copy(png, file = "Plot1.png") ## Copy my plot to a PNG file
dev.off() 
