# This file creates a histogram of Global Active Power
# Date of creation: Nov 7, 2015
# Created by Javier Lascurain as part of Coursera Course Exploratory Data Analysis
# SET WORKING DIRECTORY AND IMPORT DATA
setwd("/Users/javierlascurain-leon1/Desktop/ExData_Plotting1")
epc = read.table("/Users/javierlascurain-leon1/Desktop/EDA course/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings="?")
epc=epc[which(epc$Date=="1/2/2007"|epc$Date=="2/2/2007"),]
epc$TD = paste(epc$Date,epc$Time)
epc$TD = strptime(epc$TD,format="%d/%m/%Y %H:%M:%S",tz="")
# CREATE PLOT
png(filename="Plot1.png",width = 480, height = 480)
hist(epc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()