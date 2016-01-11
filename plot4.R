dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetD <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

subsetD$Date <- as.Date(subsetD$Date, format="%d/%m/%Y")
dateTime <- paste(subsetD$Date, subsetD$Time)
subsetD$DateTime <- as.POSIXct(dateTime)

png("plot4.png", width=480, height=480)


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subsetD, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="", cex=0.8)
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="", cex=0.8)
})

dev.off()