library(data.table)
library(datasets)

mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
mydata$Date<-as.Date(strptime(mydata$Date,"%d/%m/%Y"))
data<-subset(mydata,Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))

with(data,plot(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,ylab = "Energy sub metering",xlab = "",type ="n"))
with(data,lines(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,col = "black"))
with(data,lines(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_2,col = "red"))
with(data,lines(strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_3,col = "blue"))
legend("topright",pch = c(NA,NA,NA),col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, lty=c(1,1,1),merge=FALSE)

dev.copy(png, file = "plot3.png")
dev.off()
