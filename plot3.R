with(power_consumptn, {
    plot(Sub_metering_1~date_Time, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~date_Time,col='Red')
    lines(Sub_metering_3~date_Time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()