library(data.table)
data<-fread('./household_power_consumption.txt',na.strings = '?',colClasses = c('Date','Date',rep('numeric',7)),stringsAsFactors=FALSE)
data=as.data.frame(data)
data=data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]

timestamp<-as.POSIXct(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
data<-cbind(data,timestamp)


##Plot3
png(filename = "Plot3.png")
with(data,plot(timestamp,Sub_metering_1,type="l",col="gray"),legend="Sub_metering_1",ylab="Energy sub meterting")
with(data,points(timestamp,Sub_metering_2,type="l",col="red"),legend="Sub_metering_2")
with(data,points(timestamp,Sub_metering_3,type="l",col="blue"),legend="Sub_metering_3")
legend("topright",col=c("gray","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1)
dev.off()
