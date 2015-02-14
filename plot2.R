### Just load in the data set saved and all good to go
load("data2.RData")

## Plot No 2 
plot(data2$date.time, data2$Global_active_power, 
           xlab = "datetime",  ylab  = "Global Active Power (kwatts)", type = "l")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
