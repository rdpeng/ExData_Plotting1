 ## Plot 3 - Creating Plot 3 
> with(t, {
+     plot(Sub_metering_1~dateTime, type="l",
+          ylab="Global Active Power (kilowatts)", xlab="")
+     lines(Sub_metering_2~dateTime,col='Red')
+     lines(Sub_metering_3~dateTime,col='Blue')
+   })
>   legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
+          c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
