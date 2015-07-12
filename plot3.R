
#code assumes that the file is downloaded and unzipped in the working folder
install.packages("sqldf")
library(sqldf)
x<-read.csv.sql("household_power_consumption.txt",sql= "select * from file where Date in ('1/2/2007','2/2/2007')", sep=";",header=T,stringsAsFactors=F)
closeAllConnections()
x$Date<-as.Date(x$Date,"%d/%m/%Y")
x$date_time<-as.POSIXlt(paste(x$Date,x$Time),format="%Y-%m-%d %H:%M:%S")
png("plot3.png")
plot(x$date_time,x$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",cex.lab=0.9,lwd=1.5)
lines(x$date_time,x$Sub_metering_2,col="red",lwd=1.5)
lines(x$date_time,x$Sub_metering_3,col="blue",lwd=1.5)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="-",col=c("black","red","blue"),lty=1,lwd=2,cex=0.8)
dev.off()