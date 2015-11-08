# This file creates 4 plots in a single device of energy use in a house
# Date of creation: Nov 7, 2015
# Created by Javier Lascurain as part of Coursera Course Exploratory Data Analysis

# SET WORKING DIRECTORY AND IMPORT DATA
setwd("/Users/javierlascurain-leon1/Desktop/ExData_Plotting1")
epc = read.table("/Users/javierlascurain-leon1/Desktop/EDA course/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings="?")
epc=epc[which(epc$Date=="1/2/2007"|epc$Date=="2/2/2007"),]
epc$TD = paste(epc$Date,epc$Time)
epc$TD = strptime(epc$TD,format="%d/%m/%Y %H:%M:%S",tz="")

# CREATE PLOT
png(filename="Plot4.png",width = 480, height = 480)
par(mfrow=c(2,2),mar=c(4,6,1,1))
with(epc,plot(TD,Global_active_power,type="l",lty=1,ylab="Global Active Power",xlab="",,mar=c(2,3,1,3)))
with(epc,plot(TD,Voltage,type="l",lty=1,ylab="Voltage",xlab="datetime"),)
plot(epc$TD,epc$Sub_metering_1,type="n",ylab="Energy submetering",xlab="",mar=c(1,1,1,1))
lines(epc$TD,epc$Sub_metering_1)
lines(epc$TD,epc$Sub_metering_2,col="red")
lines(epc$TD,epc$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=.8,bty="n")
with(epc,plot(TD,Global_reactive_power,type="l",lty=1,ylab="Global Active Power",xlab="datetime",))
dev.off()