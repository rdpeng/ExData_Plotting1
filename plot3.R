### Just load in the data set saved and all good to go
load("data2.RData")

## Plot No 3 
plot(data2$date.time, data2$Sub_metering_1, 
           xlab = "datetime",  ylab  = "Energy sub metering", type = "l", col = "black")
lines(data2$date.time, data2$Sub_metering_2, col = "red", type = "l")
lines(data2$date.time, data2$Sub_metering_3, col = "green", type = "l")

legend("topright", legend = grep("Sub", names(data2), value = TRUE), 
                col=c("black", "red", "green"), pch=1) # optional legend

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
