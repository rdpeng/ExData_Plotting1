rm(list = ls())
library(sqldf)                                      ## sqldf package is called to use read.csv.sql command, this command selectively reads
setwd(paste(getwd(),"/R files",sep=""))             ## only the february 2007 data that we want, reduces memory usage
data <- read.csv.sql(file="household_power_consumption.txt",sep=";",sql= "select * from file where Date  == '1/2/2007' OR Date == '2/2/2007'", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
newdata<- data.frame(date = strptime(paste(data[,1],data[,2]),"%d/%m/%Y %H:%M:%S")) ## converts character strings date & time to POSTlx 
newdata<- cbind(newdata,data[,3:9])
rm(data)
png(filename= "plot4.png", width = 480, height = 480, units = "px",bg = "white"
par(mfrow=c(2,2))                                   ## creates two rows with two columns to fit four graphs
plot(newdata$date,newdata$Global_active_power,ylab="Global Active power",xlab="",type="l")## creates plot 1 
plot(newdata$date,newdata$Voltage,ylab="Voltage",xlab="",type="l")                        ##creates plot 2
plot(newdata$date,newdata$Sub_metering_1,ylab="Energy sub metering",xlab="datetime",type="n") ## creates plot 3 with three graphs
points(newdata$date,newdata$Sub_metering_1,type="l")
points(newdata$date,newdata$Sub_metering_2,type="l",col="red")
points(newdata$date,newdata$Sub_metering_3,type="l",col="blue")
legend("topright",pch=c("-","-","-"),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(newdata$date,newdata$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")## creates plot 4
dev.off()
