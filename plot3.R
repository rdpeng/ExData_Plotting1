dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetD <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#format date and time
subsetD$Date <- as.Date(subsetD$Date, format="%d/%m/%Y")
dateTime <- paste(subsetD$Date, subsetD$Time)
subsetD$DateTime <- as.POSIXct(dateTime)

png("plot3.png", width=480, height=480)

#plot3
with(subsetD, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  lines(Sub_metering_2~DateTime, col='Red')
  lines(Sub_metering_3~DateTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)

dev.off()