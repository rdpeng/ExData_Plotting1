########################################################
#Author=Suman Ghosh
#Created on=09-11-2014
# Exploratory Data Analysis
#Title: Course Project 1
#DataSet:Electric power consumption
#Code:1
########################################################
# Setting the path for reading data
setwd("D:/coursera/coursera_EDA/week-1/project-1/data")
# Reading the files into R Enviornment(epc=Electric power consumption)
epc<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
# converting Date Vector into a Vector of Date Class
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")

# Subsetting the data
epc_subset <- epc[(epc$Date>="2007-02-01")&(epc$Date<="2007-02-02"),]
# Remove the main file from the Global Enviornment
rm(epc)

# Converting dates
epc_date_time <- paste(as.Date(epc_subset$Date), epc_subset$Time)
epc_subset$epc_date_time <- as.POSIXct(epc_date_time)

# Plot 1
hist(epc_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
