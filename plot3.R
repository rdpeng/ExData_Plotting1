

# Printing to PNG file

png(filename="plot3.png",height = 480,width = 480)

plot(mysubset$datatime,mysubset$Sub_metering_1,type="l", main="", xlab="",ylab="Energy sub-metering")
lines(mysubset$datatime,mysubset$Sub_metering_2,col="red")
lines(mysubset$datatime,mysubset$Sub_metering_3,col="blue")


legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()