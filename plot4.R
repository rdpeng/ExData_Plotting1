setwd("C:/Users/lauren/Desktop/data Science/ExData_Plotting1")

## read in data
data<- read.csv("C:/Users/lauren/Desktop/data Science/exdata-data-household_power_consumption/household_power_consumption.txt", 
                sep=";", na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## subset data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#format data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP<- as.numeric(subSetData$Global_active_power)
GRP <- as.numeric(subSetData$Global_reactive_power)
volt <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## Creating graph
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subSetData, {
  plot(datetime, GAP, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(datetime, volt, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(datetime, subMetering1, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(datetime, subMetering2,col='Red')
  lines(datetime, subMetering3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime, GRP, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving graph
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()