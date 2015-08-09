## Author: jteed
## Exploratory Data Analysis class at Coursera
## Assignment 1
## written: August 9, 2015


##  plot4.R

##  From the household power consumption data set, narrow down to the data from 2/1/2007 to 2/2/2007 (inclusive).
##  Create a plot showing Frequency (from 0 to 1200) vs. Global Active Power (from 0 to 6 kilowatts)

# Load the data, and keeping only the data for 2/1/2007 and 2/2/2007, 
# and adding a converted DateTime column created from the date and time columns
setwd("C:/Users/Jennifer/Documents/Coursera/Exploring Data")
consumption<-read.table(file="household_power_consumption.txt", header=TRUE,  sep=";", stringsAsFactors=FALSE, na.strings="?")
consumption$Date<-as.Date(consumption$Date, format="%d/%m/%Y")

consumption<-subset(consumption, Date >= "2007-02-01")
consumption<-subset(consumption, Date <= "2007-02-02")

dtFormat<-"%Y-%m-%d %H:%M:%S"
consumption$DateTime<-as.POSIXct(strptime(paste(consumption$Date,consumption$Time,sep=" "), dtFormat))


# plot 4
# Set the size of the plot to 480pixels by 480pixels, and save it to a pdf file.
png( file="plot4.png", width=480, height=480, units="px")
old.par<- par(mfcol=c(2,2))  # two rows, two columns filled by column, top down, first.

#a
plot(consumption$Global_active_power ~ consumption$DateTime, type="l", xlab="", ylab="Global Active Power")

#b
plot(consumption$Sub_metering_1 ~ consumption$DateTime, xlab="", ylab="Energy sub metering", pch=15, type="l")
points(consumption$Sub_metering_3 ~ consumption$DateTime, col="blue", pch=15, type="l")
points(consumption$Sub_metering_2 ~ consumption$DateTime, col="red", pch=15, type="l")
legend(x='topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=1, col=c("black", "red", "blue"))

#c
plot(consumption$Voltage ~ consumption$DateTime, ylab="Voltage", xlab="datetime", pch=15, type="l")

#d
plot(consumption$Global_reactive_power ~ consumption$DateTime, xlab="datetime", ylab="Gobal_reactive_power", type="l", pch=15, lwd=1, col="black")
par(old.par)
dev.off()
