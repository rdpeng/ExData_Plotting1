## read in data
data<- read.csv("C:/Users/lauren/Desktop/data Science/exdata-data-household_power_consumption/household_power_consumption.txt", 
                sep=";", na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## subset data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#format data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP<- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## creating graph
with (subSetData, {
  plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
  lines(datetime, subMetering2, type="l", col="red")
  lines(datetime, subMetering3, type="l", col="blue")})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Saving graph
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()