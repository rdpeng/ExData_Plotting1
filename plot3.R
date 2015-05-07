## jteed
## Exploratory Data Analysis class at Coursera
## Assignment 1
## written: May 5, 2015


##  plot3.R

##  From the household power consumption data set, narrow down to the data from 2/1/2007 to 2/2/2007 (inclusive).
##  Create a plot showing 3 different types of consumption vs DateTime.

# Load the data, and keeping only the data for 2/1/2007 and 2/2/2007, 
# and adding a converted DateTime column created from the date and time columns
setwd("C:/Users/Jennifer/Documents/Coursera/Exploring Data")
consumption<-read.table(file="household_power_consumption.txt", header=TRUE,  sep=";", stringsAsFactors=FALSE, na.strings="?")
consumption$Date<-as.Date(consumption$Date, format="%d/%m/%Y")

consumption<-subset(consumption, Date >= "2007-02-01")
consumption<-subset(consumption, Date <= "2007-02-02")

dtFormat<-"%Y-%m-%d %H:%M:%S"
consumption$DateTime<-as.POSIXct(strptime(paste(consumption$Date,consumption$Time,sep=" "), dtFormat))


# plot 3
# Set the size of the plot to 480pixels by 480pixels, and save it to a pdf file.
png( file="plot3.png", width=480, height=480, units="px")
plot(consumption$Sub_metering_1 ~ consumption$DateTime, xlab="", ylab="Energy sub metering", pch=15, type="l")
points(consumption$Sub_metering_3 ~ consumption$DateTime, col="blue", pch=15, type="l")
points(consumption$Sub_metering_2 ~ consumption$DateTime, col="red", pch=15, type="l")
legend(x='topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
