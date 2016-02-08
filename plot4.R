energy <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

edates <- subset(energy, Date=="1/2/2007" | Date=="2/2/2007")
edates$Date <- factor(edates$Date)


png(file="plot4.png", width = 480, height = 480)


par(mfrow=c(2,2))

# FIRST GRAPH
plot(edates$Global_active_power, ylab="Global Active Power", type="l", xlab="", axes=FALSE)
axis(side=2, at=seq(0, 6, by=2))
axis(side=1, at=c(0, length(edates$Global_active_power)/2, length(edates$Global_active_power)), lab=c("Thu", "Fri", "Sat"))
box()

## SECOND GRAPH
plot(edates$Voltage, ylab="Voltage", type="l", xlab="datetime", axes=FALSE)

axis(side=2, at=seq(234, 236, by=2))
axis(side=1, at=c(0, length(edates$Voltage)/2, length(edates$Voltage)), lab=c("Thu", "Fri", "Sat"))
box()

### THIRD GRAPH
plot(edates$Sub_metering_1, ylab="Energy sub metering", type="l", axes=FALSE)
lines(edates$Sub_metering_2, col="red")
lines(edates$Sub_metering_3, col="blue")

axis(side=2, at=seq(0, 30, by=10))
axis(side=1, at=c(0, length(edates$Sub_metering_1)/2, length(edates$Sub_metering_1)), lab=c("Thu", "Fri", "Sat"))
box()
a=1
legend("topright", lwd=rep(a, 3), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pt.cex = 2, cex=1, y.intersp=0.5, bty="n", col=c("black", "red", "blue"))


#### FOURTH GRAPH
plot(edates$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", axes=FALSE)

axis(side=2, at=seq(0, 0.5, by=0.1))
axis(side=1, at=c(0, length(edates$Global_reactive_power)/2, length(edates$Global_reactive_power)), lab=c("Thu", "Fri", "Sat"))
box()

dev.off()
