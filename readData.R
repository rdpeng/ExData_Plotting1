#Project
# Author: Daniel Rosquete
# Course: Exploratory Analysis

library(data.table)
setwd("C:/Users/Daniel/MachineLearning/Data Science/3 - Análisis exploratorio/1 - Intro/")
if(!file.exists("resume.csv"))
{
    energy<-read.table("household_power_consumption.txt",na="?",sep=";",
                       col.names = c("Date","Time","GlobalActivePower","GlobalReactivePower",
                                     "Voltage","GlobalIntensity","SubMeteringKitchen",
                                     "SubMeteringLaundry","SubMeteringWaterHeater"),
                       colClasses = c(rep("character",2),rep("numeric",7)),header = TRUE
                       )
    energy$Date<-strptime(x = energy$Date,format = "%d/%m/%Y")
    #energy$Time<-strptime(x = energy$Time,format="%H:%M:%S")
    energy<-subset(energy,Date>"2007-01-31" & Date<"2007-02-03")
    write.csv(energy,"resume.csv")
}
energy<-read.csv("resume.csv")
energy$Date<-strptime(x = energy$Date,format = "%Y-%m-%d")
energy$Date<-paste(energy$Date,energy$Time)
energy$Time<-strptime(x = energy$Date,format = "%Y-%m-%d %H:%M:%S")
energy$Date<-NULL