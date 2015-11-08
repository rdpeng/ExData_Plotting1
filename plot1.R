#Set your working directory
setwd("C:/Coursera - Data Science/4-ExploratoryDataAnalysis/CourseProject1")

## 1.Getting data
fileURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFilename <-"HouseholdPowerConsuption.zip"
download.file(fileURL, destfile = zipFilename)
unzip(zipfile = zipFilename)

## 2.Reading data
# sqldf package is required
library(sqldf)
SQL<-"SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
Data <- read.csv.sql("household_power_consumption.txt", sql=SQL, sep=";")
Data$DateTime <- as.POSIXct(strptime(paste(Data$Date,Data$Time), "%d/%m/%Y %H:%M:%S"))

## 3.Generate PNG file
png(filename = "plot1.png", width = 480, height = 480)
hist(Data$Global_active_power,main="Global Active Power", xlab="Global Active Power (Killowats)",col="red")
dev.off()