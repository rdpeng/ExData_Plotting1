#getting the data
#I am being lazy here to gain time and looked up the row numbers t
#that forces me to import the list name with a quite inelegant method
#My first iteration involved reading the full data, and subsetting in a new data 
#the data corresponding to the dates of the assignement
#this was a bit slow
#the first line will be 666367 and the following rows correspond to the rest till the last value of 2/2/2007
dataraw <- read.delim("household_power_consumption.txt", sep = ";", dec = ".", skip=66636,nrows=2880, na.strings = "?")
#I use a vector to reassign the different columns name
dataname <- read.delim("household_power_consumption.txt", sep = ";", dec = ".",nrows=1, na.strings = "?")
vecnames<-names(dataname)
names(dataraw)<- vecnames
#making a copy not to destroy the raw data
#it helped me with troubleshooting what was going wrong
dataclean <-dataraw
#creating a time 
dataclean$FTime <- paste(dataclean$Date,dataclean$Time )
dataclean$FTime <- strptime(dataclean$FTime, format = "%d/%m/%Y %H:%M:%S")
#Here comes the plots
hist(dataclean$Global_active_power,col="red",main = "Global Active Power",xlab="Global active power (kilowatts)",ylab="Frequency")