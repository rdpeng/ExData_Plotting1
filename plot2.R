rawdata<-read.table(file.choose(), header=T, sep=";",na.string="?")
rawdata1<-rawdata

#combine date with Time (2 alternative codes)
rawdata1$timestamp <- as.POSIXct(paste(rawdata1$Date, rawdata1$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
rawdata2 <- transform(rawdata1, timestamp=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
#note: using transform to add data column
#transform(airquality,logOzone=log(Ozone)) / (a new column logozone will be created)
#transform(Ozone, logOzone = log(Ozone)) / (only a new data vector will be created)
### get correct date format
rawdata2$Date<-as.Date(rawdata2$Date, '%d/%m/%Y')

### Subset data for 2007-02-01 and 2007-02-02
rawdata2.2days<-subset(rawdata2, rawdata2$Date=="2007-02-01"|rawdata2$Date=="2007-02-02")

#Plot 2 code
plot(rawdata2.2days$timestamp,rawdata2.2days$Global_active_power,type="n",xlab="  ",ylab="Global Active Power (kilowatts)")
lines(rawdata2.2days$timestamp,rawdata2.2days$Global_active_power)