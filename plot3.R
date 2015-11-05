## Plot3

png("Plot3.png", width=4, height=4, units="in", res=300)

par(mar = c(2,2,2,1))

plot(1:2880, as.numeric(as.vector(res$Sub_metering_1)), type = "l", xaxt = "n", xlab="", ylab = "Energy sub metering")

points(1:2880, as.numeric(as.vector(res$Sub_metering_3)), type = "l", xaxt = "n", xlab="", ylab = "Energy sub metering",
       col="blue")

points(1:2880, as.numeric(as.vector(res$Sub_metering_2)), type = "l", xaxt = "n", xlab="", ylab = "Energy sub metering",
       col="red")

axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

legend("topright" ,c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
dev.off()

