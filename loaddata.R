setwd("~/Documents/Coursera/Exploratory Data/Task 1")
data=read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?") ## Read the document
head(data)
dim(data)
dataday<-data[data$Date=="01/02/2007"|data$Date=="02/02/2007",] ## Select data from the requested days
dataday$Date <- as.Date(dataday$Date, format="%d/%m/%Y")  ## Convert in Date class
dataday$Time <- strptime(paste(dataday$Date, dataday$Time), format="%Y-%m-%d %H:%M:%S") ## Convert in Time class
