data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
wdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
png("plot3.png", width=480, height=480, units="px")

 plot( as.numeric(as.character(wdata$Sub_metering_1)), type="l", xaxt="n", ylab="Energy Sub Metering", xlab="")
 lines(as.numeric(as.character(wdata$Sub_metering_2)), col="red")
lines(as.numeric(as.character(wdata$Sub_metering_3)), col="blue")
axis(1,at=1:3, lab=c("Thu", "Fri", "Sat"))

legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
