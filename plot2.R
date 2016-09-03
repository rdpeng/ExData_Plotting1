
### Script for plot 2: 

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

### Create plots from dataset and make .png copies




## PLOT 2

plot(dataset$Time,dataset$Global_active_power, type = "l", xlab = "",ylab="")
 title(ylab ="Global Active Power(kilowatts)")
 
 dev.copy(png,"plot2.png",width = 480, height = 480)
 dev.off()

