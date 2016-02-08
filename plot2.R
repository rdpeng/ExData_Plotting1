energy <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

edates <- subset(energy, Date=="1/2/2007" | Date=="2/2/2007")
edates$Date <- factor(edates$Date)

png(file="plot2.png", width = 480, height = 480)
plot(edates$Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xlab="", axes=FALSE)
axis(side=2, at=seq(0, 6, by=2))
axis(side=1, at=c(0, length(edates$Global_active_power)/2, length(edates$Global_active_power)), lab=c("Thu", "Fri", "Sat"))
box()

dev.off()