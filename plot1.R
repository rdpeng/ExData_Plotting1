library(lubridate)
library(datasets)

consumption <- subset(read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", dec=".", stringsAsFactors=FALSE), Date =="1/2/2007"| Date =="2/2/2007")
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
consumption$Time <- hms(consumption$Time)

##Plot the histogram and save it to a png file
png(file = "plot1.png", width = 480, height = 480) ##Open PNG file and create file in working directory
hist(consumption$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power") ##Create Plot and send it to the file
dev.off() ##Close the png file
