png(filename="plot4.png",width=480,height=480)

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

e=(b$Global_active_power)
e=as.numeric(e)


png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(faithful,{
  
    plot(c,e,type="l",xlab="",ylab="Global Active Power(kilowatts)")
    
    plot(c,as.numeric(b$Voltage),xlab="datetime",ylab="Voltage",type="l",col="black")
    
    plot(c,e1,type="l",xlab="",ylab="Energy sub metering",col="black")
    lines(c,e2,type="l",col="red" )
    lines(c,e3,type="l",col="blue" )
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1,lty =c(1,1,1))
    
    plot(c,as.numeric(b$Global_reactive_power),xlab="datetime",ylab="Global_reactive_power",type="l",col="black")
    mtext("Plot 4",outer=TRUE)
    
    })



dev.off()

