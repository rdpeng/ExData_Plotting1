setwd("C://Users//AnujGoyal//Desktop//R//Course4")

electricdata<-read.table("./household_power_consumption.txt",colClasses = "character",sep = ";",header = TRUE, na.strings = "?")

electricdata$Date<-as.Date(electricdata$Date, format="%d/%m/%Y")

electric<-electricdata[(electricdata$Date=="2007-02-01") | (electricdata$Date=="2007-02-02"),]

datetime<-paste(electric$Date,electric$Time)

a<-strptime(datetime,"%Y-%m-%d %H:%M:%S")

electric$datetime<-a

par(mfrow=c(2,2),mar=c(2,4,1,1),oma=c(0,0,2,0))

with(electric,{
    plot(datetime,Global_active_power,type="l",xlab = "",ylab = "Global Active Power")
    
    plot(datetime,Voltage)
    
    plot(datetime,Sub_metering_1,type="l",xlab="",ylab = "Energy sub metering")
    lines(datetime,Sub_metering_2,col="red")
    lines(datetime,Sub_metering_3,col="blue")
    legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,bty="n")
    
    plot(datetime,Global_reactive_power,type = "l")
})


dev.copy(png,file="plot4.png", width = 480, height=480)

dev.off()
