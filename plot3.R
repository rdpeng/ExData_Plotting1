# Plot 3 Script
getwd()
## Install and call library(graphics) if not already done so
library(dplyr)
if(!file.exists("4Cdir")){dir.create("4Cdir")}
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,dest="./4Cdir/4Cp1data.zip")
unzip("./4Cdir/4Cp1data.zip",exdir="./4Cdir")
## Checking the name of the file with the necessary data
list.files("./4Cdir")
## Reading in the data from household_power_consumption.txt names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
read1<-read.table("./4Cdir/household_power_consumption.txt",sep=";",col.names=names,na.strings = "?",header=TRUE)
read2<-read1[read1$Date=="1/2/2007"|read1$Date=="2/2/2007",]    
read3 <- mutate(read2, Date_Time = paste(Date, Time, sep = " "))
read3$Date_Time <- strptime(read3$Date_Time, "%d/%m/%Y %H:%M:%S")
## Note: Did not make use of as.Date() for the plotting exercise
read3[, 3:9] <- lapply(read3[, 3:9], as.numeric)
# Creating and saving the graph as plot3.png
par(mfrow = c(1,1))
with(read3,plot(Date_Time,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l"))
with(read3,lines(Date_Time,Sub_metering_2,col="red"))
with(read3,lines(Date_Time,Sub_metering_3,col="blue"))
legend("topright",lwd=0.5,col=c("black", "red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
