## Load pqckages
library(dplyr)
library(ggplot2)
## set working direcotry
setwd("C:/coursera/Data_Science/exploratory_data_analysis/project1/")
## read raw data
prjdata <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## subset the data for date range
graphdata<-subset(prjdata,as.Date(Date,"%d/%m/%Y") >= as.Date('01/02/2007',"%d/%m/%Y") & as.Date(Date,"%d/%m/%Y" ) <= as.Date('02/02/2007',"%d/%m/%Y"))
## add date & time 
datetime <- strptime(paste(graphdata$Date, graphdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
## convert global_reactive_power, submeeting1, submeeting2 & submeeting3 to numeric
globalActivePower <- as.numeric(graphdata$Global_active_power)
subMetering1 <- as.numeric(graphdata$Sub_metering_1)
subMetering2 <- as.numeric(graphdata$Sub_metering_2)
subMetering3 <- as.numeric(graphdata$Sub_metering_3)
## set the output device
png("plot3.png", width=480, height=480)
## plot line graphs
plot(datetime,subMetering1,type="l",xlab=" ", ylab="Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
## device off
dev.off()

