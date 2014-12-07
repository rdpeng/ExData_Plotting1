
# DATA --Reading and Subsetting
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
## Creating data for only "2007-02-01" and "2007-02-02"
powerSubset <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
newtime <- paste(as.Date(powerSubset$Date), powerSubset$Time)
powerSubset$Datetime <- as.POSIXct(newtime)

###plot of 4 graphs
par(mfrow=c(2,2))
with(powerSubset, plot(Datetime, Global_active_power, type = "l", ylab="Global Active Power",xlab=""))

with(powerSubset, plot(Datetime, Voltage, type = "l", main="", xlab="datetime"))

with(powerSubset, plot(Datetime, Sub_metering_1, type = "l", col="black",ylab="Energy sub metering",xlab=""))
with(powerSubset, lines(Datetime, Sub_metering_2, col="red"))
with(powerSubset, lines(Datetime, Sub_metering_3, col="blue",))

with(powerSubset, plot(Datetime, Global_reactive_power, type = "l",  xlab="datetime"))


## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()