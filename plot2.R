#Plot 2
# Author: Daniel Rosquete
# Course: Exploratory Analysis

setwd("C:/Users/Daniel/MachineLearning/Data Science/3 - Análisis exploratorio/1 - Intro/")
source("readData.R") #My Script that cleans and set tidy data

plot(x=energy$Time,y = energy$GlobalActivePower,type="l",ylab="Global Active Power(kilowatts)",xlab="")

dev.copy(png,"plot2.png")
dev.off()