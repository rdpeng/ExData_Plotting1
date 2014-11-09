library(dplyr)
## extraction of dataset
household <- read.csv("household_power_consumption.txt", header = T, sep=';', na.strings="?")
## formatting the date field 
household$Date <- as.Date(household$Date, format="%d/%m/%Y")
## Filter out only those data set containing 2007-02-01 or 2007-02-02
householdFeb2007 <- filter(household, Date ==  "2007-02-01" | Date == "2007-02-02")
rm(household)

datetime <- paste(as.Date(householdFeb2007$Date), householdFeb2007$Time)
householdFeb2007$Datetime <- as.POSIXct(datetime)

## To create step for saving generated plot to file
png(file="plot4.png", height=480, width=480)

## Plot 4
par(mfrow=c(2,2))
with(householdFeb2007, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})

## Saving to file
dev.off()
