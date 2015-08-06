#First load the library usded for this assigment
library(dplyr)

#set working directory and load the dataset previously downloaded.
setwd("C:/Users/penajes2/Documents/R/exdata_data_household_power_consumption")
data_full <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE)

#Now filter the two days that will be used for the analysis using filter function.
prueba<- filter(data_full, Date=="1/2/2007"| Date=="2/2/2007")

#convert Dates from chr format to Date format. 
prueba$Date <- as.Date(prueba$Date, format = "%d/%m/%Y") 

# Combine Date and Time variables to create  a new column in dataset named "DateTime" in as.POSIXct format 
prueba$DateTime <- as.POSIXct(paste(prueba$Date, prueba$Time))

#Create the first plot and save it in a .png file
png("plot1.png", width = 480, height = 480) 
hist(prueba$Global_active_power,ylab="Frequency",xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off() 
