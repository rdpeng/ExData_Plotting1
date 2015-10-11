setwd("C://Users//AnujGoyal//Desktop//R//Course4")

electricdata<-read.table("./household_power_consumption.txt",colClasses = "character",sep = ";",header = TRUE, na.strings = "?")

electricdata$Date<-as.Date(electricdata$Date, format="%d/%m/%Y")

electric<-electricdata[(electricdata$Date=="2007-02-01") | (electricdata$Date=="2007-02-02"),]

datetime<-paste(electric$Date,electric$Time)

a<-strptime(datetime,"%Y-%m-%d %H:%M:%S")

electric$datetime<-a

plot(electric$datetime,electric$Sub_metering_1,type="l",xlab="",ylab = "Energy net metering")
lines(electric$datetime,electric$Sub_metering_2,col="red")
lines(electric$datetime,electric$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend = c("Sub-metering_1","Sub_metering_2","SUb_metering_3"),lty=1,lwd=1)

dev.copy(png,file="plot3.png", width = 480, height=480)

dev.off()
