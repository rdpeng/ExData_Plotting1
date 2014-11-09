rawdata<-read.table(file.choose(), header=T, sep=";",na.string="?")
rawdata1<-rawdata

#combine date with Time (2 alternative codes)
rawdata2 <- transform(rawdata1, timestamp=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
#note:
### get correct date format
rawdata2$Date<-as.Date(rawdata2$Date, '%d/%m/%Y')

### Subset data for 2007-02-01 and 2007-02-02
rawdata2.2days<-subset(rawdata2, rawdata2$Date=="2007-02-01"|rawdata2$Date=="2007-02-02")

#plot 4 code
par(mfrow=c(2,2))
plot(rawdata2.2days$timestamp,rawdata2.2days$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(rawdata2.2days$timestamp,rawdata2.2days$Global_active_power)
plot(rawdata2.2days$timestamp,rawdata2.2days$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(rawdata2.2days$timestamp,rawdata2.2days$Voltage)
plot(rawdata2.2days$timestamp,rawdata2.2days$Sub_metering_1,type="n",xlab=" ",ylab="Energy sub metering")
lines(rawdata2.2days$timestamp,rawdata2.2days$Sub_metering_1)
lines(rawdata2.2days$timestamp,rawdata2.2days$Sub_metering_2, col="red")
lines(rawdata2.2days$timestamp,rawdata2.2days$Sub_metering_3, col="blue")
legend("topright",lines,lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(rawdata2.2days$timestamp,rawdata2.2days$Global_reactive_power,type="n",xlab="datetime",ylab="Global_Reactive_Power")
lines(rawdata2.2days$timestamp,rawdata2.2days$Global_reactive_power)