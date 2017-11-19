myDataFile <- "./data/household_power_consumption.txt"
myData <- read.table(myDataFile,header = TRUE,sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")
mySubsetData <- subset (myData, Date %in% c("1/2/2007", "2/2/2007"))
mySubsetData$Date <- as.Date(mySubsetData$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(mySubsetData$Date), mySubsetData$Time)
mySubsetData$Datetime <- as.POSIXct(datetime)

with(mySubsetData, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,type = "l", col='Red')
  lines(Sub_metering_3~Datetime,type = "l", col='Blue')
})
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5,cex=0.5, pt.cex = 1, col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png", height=500, width=600)
dev.off()