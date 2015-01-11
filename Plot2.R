### Exploratory Data Analytics
### Assignment 1; plot 2

library(data.table)
library(sqldf)

### Change directory location  to your desired location
setwd("C:/Users/rahul pandey/Dropbox/11 Analytics/02 Assignments/04 Data Analysis")

### Data file. I have zipped file without changing name. Update name if required
dataFile <- "household_power_consumption.txt"

### Reading data from file
DF <- read.csv(dataFile, sep=";",stringsAsFactors=FALSE,na.strings = c("?", ""))

### Subset the data as per requirements; we only need dates "1/2/2007 and 2/2/2007"
DF <- DF[DF$Date %in% c("1/2/2007","2/2/2007"), ]

### Create the variable DateTime; this is required for plots 2-4 where we are plotting against time
DF$DateTime <- as.POSIXct(paste(DF$Date, DF$Time), format="%d/%m/%Y %H:%M:%S")


### Transfer the plots to a png file; the format as suggested in the question
png(filename = "Rplot%02d.png",width = 480, height = 480, units = "px", pointsize = 12,)

### Create the final plot - Q2
### To open/verify the plot, open the file in your working directory
plot(DF$DateTime, DF$Global_active_power, xlab = "", ylab = "Global Active Power(Kilowatts)", type = "l")
title("")

### Reset the  dev.
dev.off()