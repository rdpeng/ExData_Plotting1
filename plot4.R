#Install chron package if required
##install.packages("chron")
##library("chron")

#Clear environment variables
rm(list=ls())

#Read data and subset
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdata<- subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007", select=Date:Sub_metering_3)
GRP <- as.numeric(subdata$Global_reactive_power)
GAP <- as.numeric(subdata$Global_active_power)
VOL<-as.numeric(subdata$Voltage)

##subdata=as.numeric(subdata)##instead?
subMetering1 <- as.numeric(subdata$Sub_metering_1)
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)

#read date  in format %a abbreviated day name
as.Date(subdata$Date)
x=paste(subdata$Date, subdata$Time, sep=" ")
x=strptime(x, "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

#plotUpperLeft
#png("plot2.png", width=480, height=480)
plot(x, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#dev.off()

#plotUpperRight
#png("plotV.png", width=480, height=480)
plot(x, VOL, type="l", xlab="datetime", ylab="Voltage")

#plotLowerLeft
#png("plot3.png", width=480, height=480)
plot(x, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(x, subMetering2, type="l", col="red")
lines(x, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"),bty="n",cex=0.8)
#dev.off()

#PlotLowerRight
#png("plot2.png", width=480, height=480)
plot(x, GRP, type="l", xlab="", ylab="Global-reactive-Power")

dev.off()

