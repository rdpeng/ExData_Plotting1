# plot 3 code
png(filename = "Rplot3_10.png", width = 480, height = 480)
plot(dataset$DateTime, dataset$Sub_metering_1, 
     type = "l", xlab = '', ylab = "Energy sub metering")
lines(dataset$DateTime, dataset$Sub_metering_2, 
      col = "red", xlab = '', ylab = '')
lines(dataset$DateTime, dataset$Sub_metering_3, 
      col = "blue", xlab = '', ylab = '')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                              "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, cex = 0.5)
dev.off()