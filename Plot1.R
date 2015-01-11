### Exploratory Data Analytics
### Assignment 1;Plot 1 code

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

### Transfer the plots to a png file; the format as suggested in the question
png(filename = "Plot01.png",width = 480, height = 480, units = "px", pointsize = 12,)

### Create the final plot - Q1
### To open/verify the plot, open the file in your working directory
hist(DF$Global_active_power,ylab = "Frequency", xlab = "Global Active Power(Kilowatts)",col="Red",main="Gobal Active Power")

### Reset the  dev.
dev.off()