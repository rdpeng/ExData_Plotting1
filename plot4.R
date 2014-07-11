PowerData <- read.csv("household_power_consumption.csv",header=T)

#fix date time
x <- as.Date(PowerData$Date, format="%d/%m/%Y")
datetime1 <- paste(x, PowerData$Time)
datetime <- strptime(datetime1, format="%Y-%m-%d %H:%M:%S")
PowerData$datetime <- datetime

#make plot
par(mfrow = c(2,2))

#top right
with(PowerData, plot(datetime, Global_active_power,xlab="",ylab = "Global Active Power (kilstrowatts)",type="n"))
with(PowerData, lines(datetime, Global_active_power))

#top left
with(PowerData, plot(datetime, Voltage, type="n"))
with(PowerData, lines(datetime, Voltage))

#bottom right
with(PowerData, plot(datetime, Sub_metering_1,xlab="",ylab = "Energy sub metering",type="n"))
with(PowerData, lines(datetime, Sub_metering_1))
with(PowerData, lines(datetime, Sub_metering_2, col="red"))
with(PowerData, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", cex=.8, lwd=1, col = c("black","red","blue"), legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))

#bottom left
with(PowerData, plot(datetime, Global_reactive_power, type="n"))
with(PowerData, lines(datetime, Global_reactive_power))
