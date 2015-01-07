################################################
## Course: Exploratory Data Analysis          ##
## Project 1                                  ##
## Script: plot4.R                            ##
################################################

#######################################
##  Step1: Read the data to R        ##
#######################################

cFileName <- "household_power_consumption.txt"

cols <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

## Only need the date from 1/2/2007 0:00 to 2/7/2007 23:59
dfMyData <- read.table(cFileName,sep=";", skip=66637, nrows=2880, na.strings="?", colClasses=cols)
vHeader <- read.table(cFileName, header=TRUE, na.strings="?", nrows=1, sep=";", check.names=TRUE, colClasses=cols)						  
names(dfMyData) <- names(vHeader)

#######################################
##  Step2: Plotting                  ##
#######################################

vDateTime <- paste(dfMyData$Date, dfMyData$Time, sep=" ")
tDateTime <- strptime(vDateTime, format="%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "C")  
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 11.75, bg = "transparent")
par(mfrow=c(2, 2)) ## the 2x2 plots arrangement.

## TOP-LEFT: similar to plot2
plot(tDateTime, dfMyData$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power")

## TOP-RIGHT: new plot
plot(tDateTime, dfMyData$Voltage, type="l", main="", xlab= "tDateTime", ylab="Voltage")

## BOTTOM-LEFT: similar to plot3 
plot(tDateTime, dfMyData$Sub_metering_1,type="l", main="", xlab="", ylab="Energy sub metering", col="black")
lines(tDateTime, dfMyData$Sub_metering_2, type="l", col="red")
lines(tDateTime, dfMyData$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1,col=c("black","red","blue"), box.lty=0, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## BOTTOM-RIGHT: new plot
plot(tDateTime, dfMyData$Global_reactive_power, type = "l", xlab = "tDateTime",ylab = "Global_reactive_power")

dev.off()

#######################################
## End of script -- Chih-Hao Lai     ##
#######################################
