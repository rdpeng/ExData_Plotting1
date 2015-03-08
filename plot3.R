##need to load the necessary libraries
library(plyr) 
library(datasets)
library(lubridate)

consumption <- subset(read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", dec=".", stringsAsFactors=FALSE), Date =="1/2/2007"| Date =="2/2/2007")
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
consumption$Time <- hms(consumption$Time)
consumption = mutate(consumption, Date_combined = Date + Time) ##add combined column

##Plot the diagram and save it to a png file
png(file = "plot3.png", width = 480, height = 480) ##Open PNG file and create file in working directory
with(consumption, plot(Date_combined,Sub_metering_1,xlab="",ylab="Energy sub metering", type="l"))
with(consumption, lines(Date_combined,Sub_metering_2, col="red"))
with(consumption, lines(Date_combined,Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col = c("black","blue","red"))

dev.off()