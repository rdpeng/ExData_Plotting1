## get the entire dataset 
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")
## subset the data in accordance with the project specifications
data <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## convert Date and Time variables
data$datetime <- as.POSIXct(paste(data$Date, data$Time, sep=" ")) ##, "%Y-%m-%d %H:%M:%S")

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()