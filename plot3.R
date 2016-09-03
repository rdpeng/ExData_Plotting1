## Script for plot 3:

### Download and unzip file from url.

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
download.file(url, "zipfile.zip")
datafile <- unzip("zipfile.zip")

### read data from text file into data table

dataset <- read.table(datafile, sep = ";",stringsAsFactors = FALSE, header = TRUE,na.strings = "?")

### convert date and time columns from character to Date and Time

datetimestr <- paste(dataset$Date,dataset$Time)
dataset$Time <- strptime(datetimestr,format = "%d/%m/%Y %H:%M:%S")
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

### subset dataset to keep only rewuired dates

dataset <- dataset[dataset$Date >"2007-01-31" & dataset$Date <"2007-02-03",]

## PLOT 3

plot(dataset$Time,dataset$Sub_metering_1,type ="l",ylab = "Energy sub metering", xlab="",main="")
points(dataset$Time,dataset$Sub_metering_2,type = "l",col="red")
points(dataset$Time,dataset$Sub_metering_3,type = "l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col= c("black","red","blue"))

dev.copy(png,"plot3.png",width = 480, height = 480)
dev.off()
