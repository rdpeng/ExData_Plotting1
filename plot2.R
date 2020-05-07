library(dplyr)
library(lubridate)
zipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile <- "exdata-data-household-power-consumption.zip"
#download and unzip the file
if (!file.exists(zipFile)) {download.file(zipUrl, zipFile, mode = "wb")}
dataPath <- "./data"
if (!file.exists(dataPath)) {unzip(zipFile)}
a <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";")
a$Date<-as.character(a$Date)
a <- filter(a,a$Date=="1/2/2007" | a$Date=="2/2/2007")
datetime <- strptime(paste(a$Date, a$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
a$globalActivePower <- as.numeric(a$Global_active_power)/1000
png("plot2.png", width=480, height=480)
plot(datetime, a$globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
