library(data.table)
data<-fread('./household_power_consumption.txt',na.strings = '?',colClasses = c('Date','Date',rep('numeric',7)),stringsAsFactors=FALSE)
data=as.data.frame(data)
data=data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]

timestamp<-as.POSIXct(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
data<-cbind(data,timestamp)

##Plot1
png(filename = "Plot1.png")
with(data,hist(Global_active_power,breaks=12,freq = TRUE,col = "red",main = "Global Active Power"))
dev.off()

