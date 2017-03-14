file="./household_power_consumption.txt"
powerc<-read.csv(file,sep=";",header=TRUE)
powcfeb<-powerc[as.Date(powerc$Date,"%d/%m/%Y")=="2007-02-01",]
powcfeb2<-powerc[as.Date(powerc$Date,"%d/%m/%Y")==as.Date("02/02/2007","%d/%m/%Y"),]
powcfeb1<-powerc[as.Date(powerc$Date,"%d/%m/%Y")==as.Date("01/02/2007","%d/%m/%Y"),]
powcfeb<-rbind(powcfeb1,powcfeb2) 
#2880rows 9cols


#copy powcfeb in p2 for easy typing
powcfeb$Global_active_power<-as.character(powcfeb$Global_active_power)
powcfeb$Global_active_power<-as.numeric(powcfeb$Global_active_power)
p2<-powcfeb
p2$Date<-as.character(p2$Date)
p2$Time<-as.character(p2$Time)
p2$Date<-paste(p2$Date,p2$Time)

png(filename="plot2.png", width=480, height=480,units="px")
plot(strptime(p2$Date,"%d/%m/%Y %H:%M:%S"),p2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts")
dev.off()

