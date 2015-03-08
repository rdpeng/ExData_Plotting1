##need to load the necessary libraries
library(plyr) 
library(datasets)
library(lubridate)

consumption <- subset(read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", dec=".", stringsAsFactors=FALSE), Date =="1/2/2007"| Date =="2/2/2007")
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
consumption$Time <- hms(consumption$Time)
##consumption = mutate(consumption, Weekday = weekdays(as.Date(consumption$Date))) ##add weekday column
consumption = mutate(consumption, Date_combined = Date + Time) ##add combined column

##Plot the diagram and save it to a png file
png(file = "plot2.png", width = 480, height = 480) ##Open PNG file and create file in working directory
with(consumption, plot(Date_combined,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", type="l"))
dev.off()