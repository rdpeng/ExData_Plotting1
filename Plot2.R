library(data.table)
data<-fread('./household_power_consumption.txt',na.strings = '?',colClasses = c('Date','Date',rep('numeric',7)),stringsAsFactors=FALSE)
data=as.data.frame(data)
data=data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]

timestamp<-as.POSIXct(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
data<-cbind(data,timestamp)


##Plot2
png(filename = "Plot2.png")
with(data,plot(timestamp,Global_active_power,type="l",ylab="Global Active Power(kilowatts)"))
dev.off()