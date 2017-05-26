setwd("C:/Users/Robert/Dropbox/Roberts files/Coursera/DataScience/ExploratoryDataAnalysis")
library(dplyr)
library(lubridate)
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("zipdata.zip")) {download.file(url, destfile = "zipdata.zip")}
datafilename <- unzip("zipdata.zip", list = TRUE)[1]
allData <- tbl_df(read.table(as.character(datafilename), sep = ";", header = TRUE))


### dates of interest are 1st & 2nd February 2007
selectData <- tbl_df(subset(allData, as.Date(dmy(allData$Date)) == as.Date("2007-02-02") | as.Date(dmy(allData$Date)) == as.Date("2007-02-01")))

### convert the required "factors" to numbers
selectData$Global_active_power <- as.numeric(as.character(selectData$Global_active_power))
selectData$Sub_metering_1 <- as.numeric(as.character(selectData$Sub_metering_1))
selectData$Sub_metering_2 <- as.numeric(as.character(selectData$Sub_metering_2))
selectData$Voltage <- as.numeric(as.character(selectData$Voltage))
selectData$Global_reactive_power <- as.numeric(as.character(selectData$Global_reactive_power))



### create a time variable
selectData$mytime <- strptime(paste(selectData$Date, " ", selectData$Time), format = "%d/%m/%Y %H:%M:%S")


### do the third plot - line graph of Global Active Power over time
### 
png(filename = "plot4.png")
## set up the 2 by two plot space with plots delivered columnwise
par(mfcol = c(2,2))
## add the first plot
with(selectData, plot(mytime, selectData$Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

## add the second plot
with(selectData, plot(mytime, Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = ""))
points(selectData$mytime, selectData$Sub_metering_2, col = "red", type = "l")
points(selectData$mytime, selectData$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty=1, col=c('black', 'red', 'blue'), legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))

## add the third plot
with(selectData, plot(mytime, Voltage, type = "l", xlab = "datetime"))

## add the fourth plot
with(selectData, plot(mytime, Global_reactive_power, type = "l", xlab = "datetime"))


dev.off()
