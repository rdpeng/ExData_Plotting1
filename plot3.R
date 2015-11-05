library(dplyr)
library(reshape2)
library(lubridate)


pc<- read.table("hpc.txt", header = TRUE, sep = ";", na.strings = "?")
pc<- mutate(pc, DT=dmy_hms(paste(pc$Date, pc$Time)))
ss<- filter(pc, Date=="1/2/2007" | Date=="2/2/2007")

png(file="plot3.png", width = 480, height = 480, units="px")

with(ss, plot(ss$DT, ss$Sub_metering_1, xlab= "", ylab = "Energy sub metering", type = "n"))
with(subset(ss, ss==Sub_metering_1), points(ss$DT, ss$Sub_metering_1, col="black", cex=.005))
lines(ss$DT, ss$Sub_metering_1, col="black")
with(subset(ss, ss==Sub_metering_2), points(ss$DT, ss$Sub_metering_2, col="red", cex=.005))
lines(ss$DT, ss$Sub_metering_2, col="red")
with(subset(ss, ss==Sub_metering_3), points(ss$DT, ss$Sub_metering_3, col="blue", cex=.005))
lines(ss$DT, ss$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()