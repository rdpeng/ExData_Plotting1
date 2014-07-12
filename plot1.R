PowerData <- read.csv("household_power_consumption.csv",header=T)

hist(PowerData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowats)", col="red")
