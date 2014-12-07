
# DATA --Reading and Subsetting
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
## Creating data for only "2007-02-01" and "2007-02-02"
powerSubset <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates
newtime <- paste(as.Date(powerSubset$Date), powerSubset$Time)
powerSubset$Datetime <- as.POSIXct(newtime)

## Plot of Global active power in kilowatts & time variable
plot(powerSubset$Global_active_power~powerSubset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)",  xlab="")

## Saving to png file
dev.copy(png, file="plot2a.png", height=480, width=480)
dev.off()