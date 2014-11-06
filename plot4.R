## Load library
library(lubridate)
library(dplyr)

## Read sample file
file <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
file$DateTime <- paste(file$Date,file$Time)
file$Date <- strptime(file$Date,format="%d/%m/%Y")
## Extract the data of interest
subfile <- file[file$Date >="2007-02-01" & file$Date<="2007-02-02",]
subfile$DateTime <- strptime(subfile$DateTime,format="%d/%m/%Y %H:%M:%S")
## Convert column 3-9 to numeric
subfile$Global_active_power <- as.numeric(subfile$Global_active_power)
subfile$Global_reactive_power <- as.numeric(subfile$Global_reactive_power)
subfile$Voltage <- as.numeric(subfile$Voltage)
subfile$Global_intensity <- as.numeric(subfile$Global_intensity)
subfile$Sub_metering_1 <- as.numeric(subfile$Sub_metering_1)
subfile$Sub_metering_2 <- as.numeric(subfile$Sub_metering_2)
subfile$Sub_metering_3 <- as.numeric(subfile$Sub_metering_3)
## Build up the graphs
par(mfrow=c(2,2))
plot(subfile$DateTime,subfile$Global_active_power,type="l",xlab="",ylab="Global Active Power",cex.lab=0.8,cex.axis=0.8)
plot(subfile$DateTime,subfile$Voltage,type="l",xlab="datetime",ylab="Voltage",cex.axis=0.8,cex.lab=0.8)
plot(subfile$DateTime,subfile$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",cex.lab=0.8,cex.axis=0.8)
lines(subfile$DateTime,subfile$Sub_metering_2,col="red")
lines(subfile$DateTime,subfile$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=0.5,text.width=strwidth("Sub_metering_1"),bty="n")
plot(subfile$DateTime,subfile$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",cex.axis=0.8,cex.lab=0.8)

