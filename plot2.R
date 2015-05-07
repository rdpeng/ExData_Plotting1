## jteed
## Exploratory Data Analysis class at Coursera
## Assignment 1
## written: May 5, 2015


##  plot2.R

##  From the household power consumption data set, narrow down to the data from 2/1/2007 to 2/2/2007 (inclusive).
##  Create a plot showing Global Active Power (from 0 to 6 kilowatts) vs. DateTime

# Load the data, and keeping only the data for 2/1/2007 and 2/2/2007, 
# and adding a converted DateTime column created from the date and time columns
setwd("C:/Users/Jennifer/Documents/Coursera/Exploring Data")
consumption<-read.table(file="household_power_consumption.txt", header=TRUE,  sep=";", stringsAsFactors=FALSE, na.strings="?")
consumption$Date<-as.Date(consumption$Date, format="%d/%m/%Y")

consumption<-subset(consumption, Date >= "2007-02-01")
consumption<-subset(consumption, Date <= "2007-02-02")

dtFormat<-"%Y-%m-%d %H:%M:%S"
consumption$DateTime<-as.POSIXct(strptime(paste(consumption$Date,consumption$Time,sep=" "), dtFormat))


# plot 2
# Set the size of the plot to 480pixels by 480pixels, and save it to a pdf file.
png( file="plot2.png", width=480, height=480, units="px")
plot(consumption$Global_active_power ~ consumption$DateTime, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()