### Exploratory Data Analytics
### Assignment 1; plot 3

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
png(filename = "Plot03.png",width = 480, height = 480, units = "px", pointsize = 12,)

### Create the final plot - Q3
### To open/verify the plot, open the file in your working directory
plot(DF$DateTime, DF$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
points(DF$DateTime, DF$Sub_metering_2, type = "l",col="Red")
points(DF$DateTime, DF$Sub_metering_3, type = "l",col="Blue")
legend("topright",pch=1,col=c("Black","Red","Blue"),legend =c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))

### Reset the  dev.
dev.off()