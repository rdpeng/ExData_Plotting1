setwd("C:/Users/Ben/R/Exploratory_Data_Analysis/Project1/ExData_Plotting1")
# Require Sources for function
source("readFunction.R")
# Read Data
D<-readFunction()
# convert data into numeric values
D$Global_active_power<-with(D,as.numeric(as.character(Global_active_power)))
D$Global_reactive_power<-with(D,as.numeric(as.character(Global_reactive_power)))
D$Voltage<-with(D,as.numeric(as.character(Voltage)))
D$Sub_metering_1<-with(D,as.numeric(as.character(Sub_metering_1)))
D$Sub_metering_2<-with(D,as.numeric(as.character(Sub_metering_2)))
D$Sub_metering_3<-with(D,as.numeric(as.character(Sub_metering_3)))
# Get x-ticks as index of time
timeIndex<-with(D,paste(Date,Time))
# Convert time index into a right format
timeIndex <- strptime(timeIndex, format="%Y-%m-%d %H:%M:%S")
#  Creating a png formatted file
png(filename = "plot4.png",width = 480, height = 480, units = "px"))
#Plot "Global_active_power (kilowatts)" vs. "Time Index"
par(mfrow = c(2,2), mar= c(4,4,2,1), oma=c(0,0,2,0))
with(D,
     # row 1 column 1 plot
     {plot(timeIndex,Global_active_power, type="l",
           xlab="Time Index", ylab="Global active power")
     # row 1 column 2 plot
      plot(timeIndex,Voltage, type="l", 
           xlab="datetime", ylab="Voltage")
     # row 2 column 1 plot
      plot(timeIndex,Sub_metering_1, type="l",col="black",ylab="Energy sub metering",xlab="Time Index")
      lines(timeIndex,Sub_metering_2, type="l",col="red")
      lines(timeIndex,Sub_metering_3, type="l",col="blue")
      legend("topright",legend=c("Sub_metering_1","Sub_metering_2",
                                 "Sub_metering_3"),lwd=2,col=c("black","red","blue"))
     # row 2 column 2 plot
      plot(timeIndex,Global_reactive_power, type="l", 
           xlab="datetime", ylab="Global reactive power")})
# close graphic device
dev.off()

