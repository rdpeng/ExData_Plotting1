# This file creates a time series of Global Active Power
# Date of creation: Nov 7, 2015
# Created by Javier Lascurain as part of Coursera Course Exploratory Data Analysis

# SET WORKING DIRECTORY AND IMPORT DATA
setwd("/Users/javierlascurain-leon1/Desktop/ExData_Plotting1")
epc = read.table("/Users/javierlascurain-leon1/Desktop/EDA course/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings="?")
epc=epc[which(epc$Date=="1/2/2007"|epc$Date=="2/2/2007"),]
epc$TD = paste(epc$Date,epc$Time)
epc$TD = strptime(epc$TD,format="%d/%m/%Y %H:%M:%S",tz="")

# CREATE PLOT
png(filename="Plot2.png",width = 480, height = 480)
with(epc,plot(TD,Global_active_power,type="l",lty=1,ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()
