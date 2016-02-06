rm(list = ls())
library(sqldf)                                      ## sqldf package is called to use read.csv.sql command, this command selectively reads
setwd(paste(getwd(),"/R files",sep=""))             ## only the february 2007 data that we want, reduces memory usage
data <- read.csv.sql(file="household_power_consumption.txt",sep=";",sql= "select * from file where Date  == '1/2/2007' OR Date == '2/2/2007'", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
newdata<- data.frame(date = strptime(paste(data[,1],data[,2]),"%d/%m/%Y %H:%M:%S")) ## converts character strings date & time to POSTlx 
newdata<- cbind(newdata,data[,3:9])
rm(data)
png(filename= "plot3.png", width = 480, height = 480, units = "px",bg = "white")
plot(newdata$date,newdata$Sub_metering_1,type="n",xlab="datetime",ylab="Energy sub metering")## creates plot 3 with three line graphs
points(newdata$date,newdata$Sub_metering_1,type="l")
points(newdata$date,newdata$Sub_metering_2,type="l",col="red")
points(newdata$date,newdata$Sub_metering_3,type="l",col="blue")
legend("topright",pch=c("-","-","-"),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
