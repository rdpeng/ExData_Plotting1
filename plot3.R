data$datetime<-as.POSIXct(data$datetime
                          )
attach(data)
plot(Sub_metering_1~datetime, type="l", ylab="Energy sub metering", xlab="")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
         +        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(data)