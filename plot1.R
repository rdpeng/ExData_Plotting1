energy <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

edates <- subset(energy, Date=="1/2/2007" | Date=="2/2/2007")
edates$Date <- factor(edates$Date)

png(file="plot1.png", width = 480, height = 480)

hist(edates$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", xlim=c(0, 6), ylim=c(0, 1200), axes=FALSE, main="Global Active Power")
axis(side=1, at=seq(0, 6, by=2))
axis(side=2, at=seq(0, 1200, by=200))

dev.off()