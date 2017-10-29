#Exploratory Data Analysis Project 1
#October 29 2017

#Plot1
#The data file is assumed to be sitting in a local C directory
setwd("C:/")
mydata = read.table("household_power_consumption.txt", header=TRUE, sep = ";",na.strings = "?")

#Check the data content
dim(mydata) #Confirmed dimensions in Project 1 descriptions 
names(mydata) #Confirmed correctness of the column names
str(mydata) #Understanding the type of each column

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

mydata <- subset(mydata, (Date >= "2007-02-01" & Date <= "2007-02-02")) 

hist(mydata$Global_active_power, main = "Global Active Power",xlab = "Global Active Power (kilowatts)", col = "Red")
dev.copy(png, file = "plot1.png", height = 480, width = 480) 
