# This file creates a time series of Energy Sub-metering at 3 stations
# Date of creation: Nov 7, 2015
# Created by Javier Lascurain as part of Coursera Course Exploratory Data Analysis

# SET WORKING DIRECTORY AND IMPORT DATA
setwd("/Users/javierlascurain-leon1/Desktop/ExData_Plotting1")
epc = read.table("/Users/javierlascurain-leon1/Desktop/EDA course/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings="?")
epc=epc[which(epc$Date=="1/2/2007"|epc$Date=="2/2/2007"),]
epc$TD = paste(epc$Date,epc$Time)
epc$TD = strptime(epc$TD,format="%d/%m/%Y %H:%M:%S",tz="")

# CREATE PLOT
png(filename="Plot3.png",width = 480, height = 480)
plot(epc$TD,epc$Sub_metering_1,type="n",ylab="Energy submetering",xlab="")
lines(epc$TD,epc$Sub_metering_1)
lines(epc$TD,epc$Sub_metering_2,col="red")
lines(epc$TD,epc$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()