library(data.table)
data<-fread('./household_power_consumption.txt',na.strings = '?',colClasses = c('Date','Date',rep('numeric',7)),stringsAsFactors=FALSE)
data=as.data.frame(data)
data=data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]

timestamp<-as.POSIXct(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
data<-cbind(data,timestamp)


##Plot4
png(filename = "Plot4.png")
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(data,{
  ##Plot 1
  plot(timestamp,Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
  
  ##Plot 2
  plot(timestamp,Voltage,type="l",ylab="Voltage",xlab = "datetime")
  
  ##Plot 3
  plot(timestamp,Sub_metering_1,type="l",col="gray",ylab="Energy sub meterting",xlab="")
  points(timestamp,Sub_metering_2,type="l",col="red")
  points(timestamp,Sub_metering_3,type="l",col="blue")
  
  ##Plot 4
  plot(timestamp,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
})

dev.off()