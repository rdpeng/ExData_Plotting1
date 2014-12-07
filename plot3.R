
# DATA --Reading and Subsetting
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
## Creating data for only "2007-02-01" and "2007-02-02"
powerSubset <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates
newtime <- paste(as.Date(powerSubset$Date), powerSubset$Time)
powerSubset$Datetime <- as.POSIXct(newtime)

## Plot of Energy submetring over days
with(powerSubset, {
  plot(Sub_metering_1~Datetime, type="l",ylab="Energy submetring",  xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()