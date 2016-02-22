#Plot 4
# Author: Daniel Rosquete
# Course: Exploratory Analysis

setwd("C:/Users/Daniel/MachineLearning/Data Science/3 - Análisis exploratorio/1 - Intro/")
source("readData.R") #My Script that cleans and set tidy data

par(mfrow=c(2,2),mar=c(4,4,2,1))
with(energy,{
    #Plot 1
    plot(x=energy$Time,y = energy$GlobalActivePower,type="l",ylab="Global Active Power(kilowatts)",xlab="")
    #Plot 2
    plot(x=energy$Time,y = energy$Voltage,type="l",ylab="Voltage",xlab="datetime")
    #Plot 3
    with(energy,plot(Time,SubMeteringKitchen,type="n",ylim = c(0,38),xlab = "",ylab="Enery sub metering"))
    lines(energy$Time,energy$SubMeteringKitchen,col="black")
    lines(energy$Time,energy$SubMeteringLaundry,col="red")
    lines(energy$Time,energy$SubMeteringWaterHeater,col="blue")
    legend("topright",col=c("black","red","blue"),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch = "__")
    #Plot 4
    plot(x=energy$Time,y = energy$GlobalReactivePower,type="l",ylab="Global_reactive_power",xlab="datetime")
})

dev.copy(png,"plot4.png")
dev.off()