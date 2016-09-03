url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
download.file(url, "zipfile.zip")
datafile <- unzip("zipfile.zip")
dataset <- read.table(datafile, sep = ";",stringsAsFactors = FALSE, header = TRUE,na.strings = "?")

datetimestr <- paste(dataset$Date,dataset$Time)
dataset$Time <- strptime(datetimestr,format = "%d/%m/%Y %H:%M:%S")
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

## dataset$Day <- weekdays(dataset$Date,abbreviate = TRUE)
dataset <- dataset[dataset$Date >"2007-01-31" & dataset$Date <"2007-02-03",]




## PLOT 1

hist(dataset$Global_active_power, main ="", xlab ="",ylab="", col = "red")
title(main = "Global Active Power", xlab = "Global Acive Power(kilowatts)", ylab = "Frequency")
dev.copy(png,"plot1.png")
dev.off()

## PLOT 2
plot(dataset$Time,dataset$Global_active_power, type = "l", xlab = "",ylab="")
title(ylab ="Global Active Power(kilowatts)")
dev.copy(png,"plot2.png")
dev.off()

## PLOT 3

plot(dataset$Time,dataset$Sub_metering_1,type ="l",ylab = "Energy sub metering", xlab="",main="")
points(dataset$Time,dataset$Sub_metering_1,type = "l")
points(dataset$Time,dataset$Sub_metering_2,type = "l",col="red")
points(dataset$Time,dataset$Sub_metering_3,type = "l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col= c("black","red","blue"))
dev.copy(png,"plot3.png")
dev.off()

## PLOT 4
par(mfcol=c(2,2))
## sub 1
plot(dataset$Time,dataset$Global_active_power, type = "l", xlab = "",ylab="")
title(ylab ="Global Active Power")

## sub 2
plot(dataset$Time,dataset$Sub_metering_1,type ="l",ylab = "Energy sub metering", xlab="",main="")
points(dataset$Time,dataset$Sub_metering_1,type = "l")
points(dataset$Time,dataset$Sub_metering_2,type = "l",col="red")
points(dataset$Time,dataset$Sub_metering_3,type = "l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col= c("black","red","blue"))

## sub 3
plot(dataset$Time,dataset$Voltage,xlab = "Datetime", ylab = "Voltage", type = "l")

# sub 4
plot(dataset$Time,dataset$Global_reactive_power,xlab = "Datetime",ylab = "Global_reactive_power", type = "l")

## Copy to png
dev.copy(png, "plot4.png")
