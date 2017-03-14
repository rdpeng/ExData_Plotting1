file="./household_power_consumption.txt"
powerc<-read.csv(file,sep=";",header=TRUE)
powcfeb2<-powerc[as.Date(powerc$Date,"%d/%m/%Y")==as.Date("02/02/2007","%d/%m/%Y"),]
powcfeb1<-powerc[as.Date(powerc$Date,"%d/%m/%Y")==as.Date("01/02/2007","%d/%m/%Y"),]
powcfeb<-rbind(powcfeb1,powcfeb2) 
#2880rows 9cols

powcfeb$Global_active_power<-as.character(powcfeb$Global_active_power)
powcfeb$Global_active_power<-as.numeric(powcfeb$Global_active_power)

#copy powcfeb in p2 for easy typing
p2<-powcfeb
p2$Date<-as.character(p2$Date)
p2$Time<-as.character(p2$Time)

p2$Date<-paste(p2$Date,p2$Time)

p2$Sub_metering_1<-as.character(p2$Sub_metering_1)
p2$Sub_metering_2<-as.character(p2$Sub_metering_2)
p2$Sub_metering_3<-as.character(p2$Sub_metering_3)
p2$Sub_metering_1<-as.numeric(p2$Sub_metering_1)
p2$Sub_metering_2<-as.numeric(p2$Sub_metering_2)
p2$Sub_metering_3<-as.numeric(p2$Sub_metering_3)

png(filename="plot3.png", width=480, height=480,units="px")
plot(strptime(p2$Date,"%d/%m/%Y %H:%M:%S"),p2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(strptime(p2$Date,"%d/%m/%Y %H:%M:%S"),p2$Sub_metering_2,type="l",col="red")
lines(strptime(p2$Date,"%d/%m/%Y %H:%M:%S"),p2$Sub_metering_3,type="l",col="blue")
legend("topright",pch="_",lwd =3,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
