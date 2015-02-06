setwd("C:/Users/Ben/R/Exploratory_Data_Analysis/Project1/ExData_Plotting1")
# Require Sources for function
source("readFunction.R")
# Read Data
D<-readFunction()
# convert data into numeric values
D$Global_active_power<-with(D,as.numeric(as.character(Global_active_power)))
# Get x-ticks as index of time
timeIndex<-with(D,paste(Date,Time))
# Convert time index into a right format
timeIndex <- strptime(timeIndex, format="%Y-%m-%d %H:%M:%S")
#  Creating a png formatted file
png(filename = "plot2.png",width = 480, height = 480, units = "px"))
#Plot "Global_active_power (kilowatts)" vs. "Time Index"
par(mfrow = c(1,1))
with(D,plot(timeIndex,Global_active_power, type="l", xlab="Time Index", ylab="Global active power (kilowatts)"))
# close graphic device
dev.off()
