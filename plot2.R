setwd("C:/Users/Robert/Dropbox/Roberts files/Coursera/DataScience/ExploratoryDataAnalysis")
library(dplyr)
library(lubridate)
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("zipdata.zip")) {download.file(url, destfile = "zipdata.zip")}
datafilename <- unzip("zipdata.zip", list = TRUE)[1]

allData <- tbl_df(read.table(as.character(datafilename), sep = ";", header = TRUE))


### dates of interest are 1st & 2nd February 2007
selectData <- tbl_df(subset(allData, as.Date(dmy(allData$Date)) == as.Date("2007-02-02") | as.Date(dmy(allData$Date)) == as.Date("2007-02-01")))

### convert the power "factor" to a number
selectData$Global_active_power <- as.numeric(as.character(selectData$Global_active_power))

### create a time variable
selectData$mytime <- strptime(paste(selectData$Date, " ", selectData$Time), format = "%d/%m/%Y %H:%M:%S")


### do the second plot - line graph of Global Active Power over time
### 
png(filename = "plot2.png")
with(selectData, plot(mytime, selectData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
