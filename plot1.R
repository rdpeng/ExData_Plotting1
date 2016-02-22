#Plot 1
# Author: Daniel Rosquete
# Course: Exploratory Analysis

setwd("C:/Users/Daniel/MachineLearning/Data Science/3 - Análisis exploratorio/1 - Intro/")
source("readData.R") #My Script that cleans and set tidy data

hist(x=energy$GlobalActivePower,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.copy(png,"plot1.png")
dev.off()