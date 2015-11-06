# Coursera Exploratory Data Analysis
# Course Project 1
# 6/11/2015 by Cocu23

# Set Working Directory
setwd("/Users/christiankukuk/Documents/R Workspace/Exploratory Data Analysis")
getwd()

# Read Data
powerconsumption <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?")

# only data from 2007-02-01 and 2007-02-02 will be extracted
workdata<- subset(powerconsumption, Date== "1/2/2007" | Date== "2/2/2007")

# Converting dates
datetime <- paste(as.Date(workdata$Date), workdata$Time)
workdata$Datetime <- as.POSIXct(datetime)
globalActivePower <- as.numeric(workdata$Global_active_power)
subMetering1 <- as.numeric(workdata$Sub_metering_1)
subMetering2 <- as.numeric(workdata$Sub_metering_2)
subMetering3 <- as.numeric(workdata$Sub_metering_3)



# Plot 4
png(filename = "plot4.png",width = 480, height = 480)

# Define two rows and two columns with adjusted margins for better reading
par(mfrow=c(2,2),mar=c(4,4,1,1))

# Chart 1
plot(globalActivePower, type="l", ylim=range(globalActivePower), axes=F, ann=T, xlab=NA,ylab='Global Active Power')
axis(1, at=c(0,nrow(workdata)/2,nrow(workdata)),labels=c('Thu','Fri','Sat'))
axis(2)
box()

# Chart 2
plot(workdata$Voltage, type="l", ylim=range(workdata$Voltage), axes=F, ann=T, xlab='datetime',ylab='Voltage')
axis(1, at=c(0,nrow(workdata)/2,nrow(workdata)),labels=c('Thu','Fri','Sat'))
axis(2)
box()

# Chart 3
plot(workdata$Global_active_power, type="n", ylim=range(l_min,l_max), axes=F, ann=T, xlab=NA,ylab='Energy sub metering')
axis(1, at=c(0,nrow(workdata)/2,nrow(workdata)),labels=c('Thu','Fri','Sat'))
axis(2)
box()
lines(subMetering1)
lines(subMetering2,col='Red')
lines(subMetering3,col='Blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c('Black','Red','Blue'),lty=c(1,1,1),cex=0.7)

# Chart 4
plot(workdata$Global_reactive_power, type="l", ylim=range(workdata$Global_reactive_power), axes=F, ann=T, xlab='datetime',ylab='Global_reactive_power')
axis(1, at=c(0,nrow(workdata)/2,nrow(workdata)),labels=c('Thu','Fri','Sat'))
axis(2)
box()

# Close device
dev.off()
