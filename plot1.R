setwd("C:/Users/Robert/Dropbox/Roberts files/Coursera/DataScience/ExploratoryDataAnalysis")
library(dplyr)
library(lubridate)
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("zipdata.zip")) {download.file(url, destfile = "zipdata.zip")}
unzip("zipdata.zip", list = TRUE)[1]
datafilename <- unzip("zipdata.zip", list = TRUE)[1]
allData <- tbl_df(read.table(as.character(datafilename), sep = ";", header = TRUE))
### first thing is to select by date, so need to change Date from factor to real date
allData$Date <- dmy(allData$Date)
allData$Time <- hms(allData$Time)
### dates of interest are 1st & 2nd February 2007
selectData <- tbl_df(subset(allData, as.Date(allData$Date) == as.Date("2007-02-02") | as.Date(allData$Date) == as.Date("2007-02-01")))

### do the first plot - histogram of Global Active Power
selectData$Global_active_power <- as.numeric(as.character(selectData$Global_active_power))
png(filename = "plot1.png")
hist(selectData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()
