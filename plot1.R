#Gelonia Dent
# Exploratory Data- Project 1
# plot1.R 
#This code will produce a frequency histogram for the Global Active Power during the two-day
# period 2007-01-01 and 2001-02-01. 
# The output will be a PNG file named "plot1.png".

# Data File Source
# https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
# https://archive.ics.uci.edu/ml/machine-learning-databases/00235/
# Download the archive and save in a local repository. 
# General Description: The power consumption data file is in text format, *.txt and the datum measures power consumption
# in one household with a one-minute sampling rate over a 4 year period. 

#Load packages
library(plyr,dplyr)
library(data.table)
library(chron)

#Testing system Date format

format(Sys.Date(), "%a %b %d")

lct <- Sys.getlocale("LC_TIME"); Sys.setlocale("LC_TIME", "C")
dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
as.Date(dates, "%a %b %d")
Sys.setlocale("LC_TIME", lct)

# Set the working directory where data file and output files will be stored. 

setwd("~/Desktop/Coursera_R/ExData_Plotting1")
file=paste(getwd(),"/household_power_consumption.txt",sep="")


# Load the data into variable "power" for the date range February 1,2007 to February 2, 2007

power<-read.table(file,header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
power<-power[power$Date %in% c("1/2/2007", "2/2/2007"),]
power$Date <-strptime(power$Date, "%a %b %d")
#power$Time<-chron(power[power$Time]=time)

#Plot 1 Globlal Active Power
fname1<-paste(getwd(),"/plot1.png",sep="")

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
hist(power$Global_active_power,col="red",main="Global Active Power",xlab="Global active power(kilowatts)")
dev.off()
