### Just load in the data set saved and all good to go
load("data2.RData")

par(mfrow=c(2,2)) # all plots on one page 

## Plot No 4 

## figure #1
plot(data2$date.time, data2$Global_active_power, 
           xlab = "datetime",  ylab  = "Global Active Power (kwatts)", type = "l")

## figure #2
plot(data2$date.time, data2$Voltage, 
           xlab = "datetime",  ylab  = "Voltage", type = "l")

## figure #3
plot(data2$date.time, data2$Sub_metering_1, 
           xlab = "datetime",  ylab  = "Energy sub metering", type = "l", col = "black")
lines(data2$date.time, data2$Sub_metering_2, col = "red", type = "l")
lines(data2$date.time, data2$Sub_metering_3, col = "green", type = "l")
legend("topright", legend = grep("Sub", names(data2), value = TRUE), cex = .5,
                col=c("black", "red", "green"), pch = 1) # optional legend

## figure #4
plot(data2$date.time, data2$Global_reactive_power, ylim = c(0, 0.5),
           xlab = "datetime",  ylab  = "Global Reactive Power (kwatts)", type = "l")
                
## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
