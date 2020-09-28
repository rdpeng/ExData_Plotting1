library("data.table")
#Save file in that folder
setwd("/Users/isabelmendez/Documents/R/ExploratoryDataAnalysis-Assignment_CourseProject1")

#Load Data

data <- read.table("/Users/isabelmendez/Documents/R/ExploratoryDataAnalysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
summary(data)

## Format date to Type Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Get data from the dates 2007-02-01 and 2007-02-02
data <- subset(data,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Combine Date and Time column
dateTime <- paste(data$Date, data$Time)
dateTime <- setNames(dateTime, "DateTime")
data <- cbind(dateTime, data)
data$dateTime <- as.POSIXct(dateTime)

#Variables: 

globalActivePower <- as.numeric(data$Global_active_power)
globalReactivePower <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)


# Create a Plot for sub_metering
## Create Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~dateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(subMetering1~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(subMetering2~dateTime,col='Red')
  lines(subMetering3~dateTime,col='Blue')
  legend("topright", col=c("black", "green", "blue"), #lty=1, lwd=2, bty="n"
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
         , lty=c(1,1)
         , bty="n"
         , cex=.5)
  plot(Global_reactive_power~dateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()