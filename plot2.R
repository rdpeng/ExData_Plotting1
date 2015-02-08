library(lubridate)
png(filename="plot2.png",width=480,height=480)

a=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

b=a
b$Date= dmy(b$Date)

b=subset(b,Date==dmy("1/2/2007")|Date==dmy("2/2/2007"))

b=b[complete.cases(b$Global_active_power),]

 
c=strptime(ymd_hms(paste(as.character(b$Date),as.character(b$Time))),"%Y-%m-%d %H:%M:%S")

e=(b$Global_active_power)
e=as.numeric(e)

with(faithful,plot(c,e,type="l",ylab="Global Active Power(kilowatts)"))

dev.off()
