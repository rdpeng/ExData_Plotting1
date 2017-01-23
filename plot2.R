### Coursera Explorator Data Analysis Course Project1
### Sylwester Dec

### plot2.R

## Getting data, download, unzip and create data frame
library(data.table)
getwd()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "PowerCons.zip")
unzip(zipfile = "PowerCons.zip", overwrite = TRUE)
data<-read.table("household_power_consumption.txt",header = TRUE, sep = ';', na.strings = "?")


## Convert Date Column to date format - Date1 column
data$Date1 <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset data to 2007-02-01 and 2007-02-02
data <- subset(data, subset = (Date1>="2007-02-01" & Date1<="2007-02-02"))

##Convert to date+time
data$datetime = paste(data$Date, data$Time)
data$datetime = as.POSIXlt(data$datetime,format="%d/%m/%Y %H:%M:%S")

## Plot2
plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## export png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
