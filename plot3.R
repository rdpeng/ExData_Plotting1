setwd("C:/Users/Ben/R/Exploratory_Data_Analysis/Project1/ExData_Plotting1")
# Require Sources for function
source("readFunction.R")
# Read Data
D<-readFunction()
# convert data into numeric values
D$Sub_metering_1<-with(D,as.numeric(as.character(Sub_metering_1)))
D$Sub_metering_2<-with(D,as.numeric(as.character(Sub_metering_2)))
D$Sub_metering_3<-with(D,as.numeric(as.character(Sub_metering_3)))
# Get x-ticks as index of time
timeIndex<-with(D,paste(Date,Time))
# Convert time index into a right format
timeIndex <- strptime(timeIndex, format="%Y-%m-%d %H:%M:%S")
#  Creating a png formatted file
png(filename = "plot3.png")
#Plot "Global_active_power (kilowatts)" vs. "Time Index"
par(mfrow = c(1,1))
with(D,plot(timeIndex,Sub_metering_1, type="l",col="black",ylab="Energy sub metering",xlab="Time Index"))
with(D,lines(timeIndex,Sub_metering_2, type="l",col="red"))
with(D,lines(timeIndex,Sub_metering_3, type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2",
          "Sub_metering_3"),lwd=2,col=c("black","red","blue"))
# close graphic device
dev.off()



