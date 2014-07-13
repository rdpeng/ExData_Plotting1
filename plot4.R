## Fourth plot

# Opening the PNG device
png(file="plot4.png",width=480, height=480)

par(mfrow=c(2,2))
# Topleft
with(lilData,(plot(Time,Global_active_power,xlab = "",ylab = "Global Active Power",
                   type = "l")))
# Toprigt
with(lilData,(plot(Time,Voltage,xlab = "datetime",ylab = "Voltage",
                   type = "l")))
# Bottomleft
with(lilData,(plot(Time,Sub_metering_1,xlab = "",ylab = "Energy sub metering",type = "l",
                   col = "black")))
lines(x = lilData$Time,y = lilData$Sub_metering_2, col = "red")
lines(x = lilData$Time,y = lilData$Sub_metering_3, col = "blue")
legdat = names(lilData[,7:9])
legend("topright",legend = legdat,col = c("black","red","blue"),
       lty = c(1,1,1),bty = "n")

# Bottomright
with(lilData,(plot(Time,Global_reactive_power,xlab = "datetime",type = "l",
                   col = "black",lwd=0.2)))


# Closening the PNG device
dev.off() 