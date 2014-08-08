#Exploratory Analysis
#Course Project 1

#Clean up the workspace
rm(list=ls())

#Set working directory
setwd("C:/Users/Sandra/DataScience/ExploratoryAnalysis/CourseProject1")

##Download datasets package
library(datasets)

##Read file to data frame and format date and time
pwrcons<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
pwrcons$DateTime=paste(pwrcons$Date,pwrcons$Time)
pwrcons$DateTime=as.POSIXlt(pwrcons$DateTime,format="%d/%m/%Y %H:%M:%S")
pwrcons$Date=NULL
pwrcons$Time=NULL
subpwrcons<-subset(pwrcons,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

##Create PNG plot

##Open PNG device; create 'Plot4.png'
png(file="Plot4.png",height=480,width=480)

##Create plot and send to file
par(mfrow=c(2, 2))

### plot (NW)
plot(x=(subpwrcons$DateTime),y=subpwrcons$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
    
### plot (NE)
plot(x=(subpwrcons$DateTime),y=subpwrcons$Voltage,type="l",ylab="Voltage",xlab = "datetime")

### plot (SW)
plot(x=(subpwrcons$DateTime),y=subpwrcons$Sub_metering_1,type="l",ylab="Energy sub metering",xlab ="")
lines(x=(subpwrcons$DateTime),y=subpwrcons$Sub_metering_2,col="red")
lines(x=(subpwrcons$DateTime),y=subpwrcons$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.4)

### plot (SE)
plot(subpwrcons$DateTime,subpwrcons$Global_reactive_power,type="l",xlab="datetime") 

     
##Close the PNG file device
dev.off()
