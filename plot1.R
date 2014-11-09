rawdata<-read.table(file.choose(), header=T, sep=";",na.string="?")
rawdata1<-rawdata

#combine date with Time (2 alternative codes)
rawdata2 <- transform(rawdata1, timestamp=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

### get correct date format
rawdata2$Date<-as.Date(rawdata2$Date, '%d/%m/%Y')

### Subset data for 2007-02-01 and 2007-02-02
rawdata2.2days<-subset(rawdata2, rawdata2$Date=="2007-02-01"|rawdata2$Date=="2007-02-02")

#Plot 1 code
hist(rawdata2.2days$Global_active_power, col="red", ylab="Frequency",xlab="Global Active Power (kilowatts)", main="Global Active Power")
