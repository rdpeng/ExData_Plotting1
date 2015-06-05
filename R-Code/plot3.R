￼## Generating Plot 3
with(Data, {
    plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "") 
    lines(Sub_metering_2 ~ Datetime, col = 'Red') 
    lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
      legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 

## Saves data to file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
