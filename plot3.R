## plot3
png("plot3.png", width = 480, height = 480, units = "px")
with(plotdata, {
        plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "" )
        points(DateTime, Sub_metering_2, type = "l", col = "red" )
        points(DateTime, Sub_metering_3, type = "l", col = "blue" )
        legend("topright", lty = "solid", lwd =1, col = c("black", "red", " blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
        ## dev.copy(png, file = "plot2.png")
dev.off()
