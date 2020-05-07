library(dplyr)
zipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile <- "exdata-data-household-power-consumption.zip"
#download and unzip the file
if (!file.exists(zipFile)) {download.file(zipUrl, zipFile, mode = "wb")}
dataPath <- "./data"
if (!file.exists(dataPath)) {unzip(zipFile)}
a <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";")
a$Date<-as.character(a$Date)
a <- filter(a,a$Date=="1/2/2007" | a$Date=="2/2/2007")
a$Global_active_power<-as.numeric(a$Global_active_power)/1000
png("plot1.png", width=480, height=480)
hist(a$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off()
