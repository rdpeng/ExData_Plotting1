source('load_data.R')

data <- loadData()

png(filename='plot4.png', width=480, height=480, units='px')

par(mfrow=c(2,2))

startDay = as.POSIXct(strftime("2007-02-01 00:00:00"))
endDay = as.POSIXct(strftime("2007-02-03 00:00:00"))

plot(data$Time,
     data$Global_active_power,
     xlim=c(startDay, endDay),
     xaxt="n",
     type="l",
     xlab="",
     ylab="Global Active Power"
)
axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

plot(data$Time,
     data$Voltage,
     xlim=c(startDay, endDay),
     xaxt="n",
     type="l",
     xlab="datetime",
     ylab="Voltage"
)
axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

plot(data$Time,
     data$Sub_metering_1,
     xlim=c(startDay, endDay),
     xaxt="n",
     type="l",
     xlab="",
     ylab="Energy sub metering"
)

lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")

axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

legend("topright", 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lty=c(1, 1, 1))

plot(data$Time,
     data$Global_reactive_power,
     xlim=c(startDay, endDay),
     xaxt="n",
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power"
)
axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

dev.off()
