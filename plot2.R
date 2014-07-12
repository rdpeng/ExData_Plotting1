PowerData <- read.csv("household_power_consumption.csv",header=T)

x <- as.Date(PowerData$Date, format="%d/%m/%Y")
datetime1 <- paste(x, PowerData$Time)
datetime <- strptime(datetime1, format="%Y-%m-%d %H:%M:%S")
PowerData$datetime <- datetime

with(PowerData, plot(datetime, Global_active_power,xlab="",ylab = "Global Active Power (kilstrowatts)",type="n"))

with(PowerData, lines(datetime, Global_active_power))
