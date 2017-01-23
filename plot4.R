### Coursera Explorator Data Analysis Course Project1
### Sylwester Dec

### plot4.R

## Getting data, download, unzip and create data frame
library(data.table)
getwd()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "PowerCons.zip")
unzip(zipfile = "PowerCons.zip", overwrite = TRUE)
data<-read.table("household_power_consumption.txt",header = TRUE, sep = ';', na.strings = "?")


## Convert Date Column to date format - Date1 column
data$Date1 <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset data to 2007-02-01 and 2007-02-02
data <- subset(data, subset = (Date1>="2007-02-01" & Date1<="2007-02-02"))

##Convert to date+time
data$datetime = paste(data$Date, data$Time)
data$datetime = as.POSIXlt(data$datetime,format="%d/%m/%Y %H:%M:%S")

## create plot 2x2 with slots for charts 
png(filename='plot4.png', width=480, height=480, units='px')
par(mfrow=c(2,2))


## Create Plot1
plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")


## Create Plot2
plot(data$datetime, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

## Create Plot3
## convert datetime to required format
data$datetime = paste(data$Date1, data$Time)
data$datetime = as.POSIXct(data$datetime)

with(data, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  lines(Sub_metering_2~datetime, col='Red')
  lines(Sub_metering_3~datetime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)


## Plot4
plot(data$datetime, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


## Close and save PNG
dev.off()

