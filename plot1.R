#unzip the file into the working directory
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(url,temp)
powerfile <- unzip(temp)
unlink(temp)
rm(url, temp)

#read data into R
library(readr)
powerdata <- read.table(powerfile[1], header = TRUE, sep = ";", na.strings = "?")
rm(powerfile)

#filter out only the specified dates
library(dplyr)
powerdatasmall <- filter(powerdata, Date == "1/2/2007" | Date == "2/2/2007")
rm(powerdata)

#create the POSIX object
library(tidyr)
powerdatasmall$Date <- as.character(powerdatasmall$Date)
powerdatasmall$Time <- as.character(powerdatasmall$Time)
powerdatasmall <- mutate(powerdatasmall, datetime = paste(Date, Time, sep = "/"))
powerdatasmall$datetime <- strptime(powerdatasmall$datetime, format = "%d/%m/%Y/%H:%M:%S")

#graph in a file
png(filename = "plot1.png", width = 480, height = 480)
hist(powerdatasmall$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
