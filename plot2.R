# Coursera Exploratory Data Analysis
# Course Project 1
# 6/11/2015 by Cocu23

# Set Working Directory
setwd("/Users/christiankukuk/R Workspace/Exploratory Data Analysis")
getwd()

# Read Data
powerconsumption <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?")

# only data from 2007-02-01 and 2007-02-02 will be extracted
workdata<- subset(powerconsumption, Date== "1/2/2007" | Date== "2/2/2007")
# QC if the right subset was created
head(workdata)
summary(workdata)
# 1/2/2007   2/2/2007
# 1440        1440

## Converting dates
datetime <- paste(as.Date(workdata$Date), workdata$Time)
workdata$Datetime <- as.POSIXct(datetime)

# Plot 2
globalActivePower <- as.numeric(workdata$Global_active_power)
plot(globalActivePower~workdata$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

# Saving as png 
png("plot2.png", width=480, height=480)
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
