#Plot 3
# Author: Daniel Rosquete
# Course: Exploratory Analysis

setwd("C:/Users/Daniel/MachineLearning/Data Science/3 - Análisis exploratorio/1 - Intro/")
source("readData.R") #My Script that cleans and set tidy data

with(energy,plot(Time,SubMeteringKitchen,type="n",ylim = c(0,38),xlab = "",ylab="Enery sub metering"))
lines(energy$Time,energy$SubMeteringKitchen,col="black")
lines(energy$Time,energy$SubMeteringLaundry,col="red")
lines(energy$Time,energy$SubMeteringWaterHeater,col="blue")
legend("topright",col=c("black","red","blue"),
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch = "__")

dev.copy(png,"plot3.png")
dev.off()