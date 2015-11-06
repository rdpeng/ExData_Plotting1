# Coursera Exploratory Data Analysis
# Course Project 1
# 6/11/2015 by Cocu23

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



# Plot 3
png("plot3.png", width=480, height=480)

# List min and max of sub metering variables to define proper range
l_min<-c(min(subMetering1),min(subMetering2),min(subMetering3))
l_max<-c(max(subMetering1),max(subMetering2),max(subMetering3))

# Plot the chart without axis
plot(globalActivePower, type="n", ylim=range(l_min,l_max), axes=F, ann=T, xlab=NA,ylab='Energy sub metering')
# Add x axis with three ticks and three labels
axis(1, at=c(0,nrow(workdata)/2,nrow(workdata)),labels=c('Thu','Fri','Sat'))
# Add y axis
axis(2)
# Box it up
box()

# Add lines for each sub metering variable
lines(workdata$Sub_metering_1)
lines(workdata$Sub_metering_2,col='Red')
lines(workdata$Sub_metering_3,col='Blue')

# Add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c('Black','Red','Blue'),lty=c(1,1,1))

# Close device
dev.off()


