source("main.R")

# Plot 3 ----------------------------

plot(data$Time, data$Sub_metering_1, 
     type="l", ylab="Energy sub metering", cex.lab=0.8)

# add other submeterings as separate lines
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")

# Legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"), cex=0.7)



# create a file plot3.png and save the output in this file
dev.copy(png, file = "plot3.png",  width = 480, height = 480)
dev.off()