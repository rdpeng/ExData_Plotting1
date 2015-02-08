library(lubridate)
png(filename="plot3.png",width=480,height=480)

a=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

b=a
b$Date= dmy(b$Date)
b=subset(b,Date==dmy("1/2/2007")|Date==dmy("2/2/2007"))
b=b[complete.cases(b$Global_active_power),]

c=strptime(ymd_hms(paste(as.character(b$Date),as.character(b$Time))),"%Y-%m-%d %H:%M:%S")

e1=(b$Sub_metering_1)
e1=as.numeric(e1)

e2=(b$Sub_metering_2)
e2=as.numeric(e2)

e3=(b$Sub_metering_3)
e3=as.numeric(e3)

with(faithful,plot(c,e1,type="l",ylab="Energy sub metering",col="black"))
with(faithful,lines(c,e2,type="l",col="red" ))
with(faithful,lines(c,e3,type="l",col="blue" ))
with(faithful,legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1,lty =c(1,1,1)))
               
     
dev.off()

