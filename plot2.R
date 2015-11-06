# Coursera Exploratory Data Analysis
# Course Project 1
# 6/11/2015 by Cocu23

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
globalActivePower <- as.numeric(workdata$Global_active_power)

# Plot 2
png("plot2.png", width=480, height=480)
plot(globalActivePower, type="l", ylim=range(globalActivePower), axes=F, ann=T, xlab=NA,ylab='Global Active Power (Kilowatts)')
#Add x-axis with three ticks and three labels, y-axis and box
axis(1, at=c(0,nrow(workdata)/2,nrow(workdata)),labels=c('Thu','Fri','Sat'))
box()
dev.off()
