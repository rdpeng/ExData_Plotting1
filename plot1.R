library(lubridate)
png(filename="plot1.png",width=480,height=480)

a=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

b=a
b$Date= dmy(b$Date)

b=subset(b,Date==dmy("1/2/2007")|Date==dmy("2/2/2007"))

b=b[complete.cases(b$Global_active_power),]




e=(b$Global_active_power)
e=as.numeric(e)
with(faithful,hist(e,xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power", col="red"))

dev.off()
