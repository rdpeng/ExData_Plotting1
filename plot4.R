library(dplyr)
library(reshape2)
library(lubridate)


pc<- read.table("hpc.txt", header = TRUE, sep = ";", na.strings = "?")
pc<- mutate(pc, DT=dmy_hms(paste(pc$Date, pc$Time)))
ss<- filter(pc, Date=="1/2/2007" | Date=="2/2/2007")

png(file="plot4.png", width = 480, height = 480, units="px")

par(mfrow=c(2,2), mar=c(4,4,4,4))
with(ss, {
  plot(ss$DT, ss$Global_active_power, xlab= "", ylab="Global Active Power (kilowatts)", cex=.0005)
  lines(ss$DT, ss$Global_active_power)
  plot(ss$DT, ss$Voltage, xlab= "datetime", ylab="Voltage", cex=.0005)
  lines(ss$DT, ss$Voltage)
  plot(ss$DT, ss$Sub_metering_1, xlab= "", ylab = "Energy sub metering", type = "n")
  with(subset(ss, ss==Sub_metering_1), points(ss$DT, ss$Sub_metering_1, col="black", cex=.005))
  lines(ss$DT, ss$Sub_metering_1, col="black")
  with(subset(ss, ss==Sub_metering_2), points(ss$DT, ss$Sub_metering_2, col="red", cex=.005))
  lines(ss$DT, ss$Sub_metering_2, col="red")
  with(subset(ss, ss==Sub_metering_3), points(ss$DT, ss$Sub_metering_3, col="blue", cex=.005))
  lines(ss$DT, ss$Sub_metering_3, col="blue")
  legend("topright", bty="n", "Legend", cex=.75, pt.cex=.75, lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(ss$DT, ss$Global_reactive_power, xlab= "datetime", ylab="Global_reactive_power", cex=.0005)
  lines(ss$DT, ss$Global_reactive_power)
})
dev.off()