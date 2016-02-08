energy <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

edates <- subset(energy, Date=="1/2/2007" | Date=="2/2/2007")
edates$Date <- factor(edates$Date)

png(file="plot3.png", width = 480, height = 480)
plot(edates$Sub_metering_1, ylab="Energy sub metering", type="l", xlab="", axes=FALSE)
lines(edates$Sub_metering_2, col="red")
lines(edates$Sub_metering_3, col="blue")


axis(side=2, at=seq(0, 30, by=10))
axis(side=1, at=c(0, length(edates$Sub_metering_1)/2, length(edates$Sub_metering_1)), lab=c("Thu", "Fri", "Sat"))
box()

a=1
legend("topright", lwd=rep(a, 3), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pt.cex = 2, cex=0.8, y.intersp=0.3, col=c("black", "red", "blue"))

dev.off()