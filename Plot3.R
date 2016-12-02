#Plot 3
plot_Data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
period <- plot_Data[plot_Data$Date %in% c("1/2/2007","2/2/2007"),]
convert_time <-strptime(paste(period$Date, period$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
period <- cbind(convert_time, period)
color_lines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(period$convert_time, period$Sub_metering_1, type="l", col=color_lines[1], xlab="", ylab="Energy sub metering")
lines(period$convert_time, period$Sub_metering_2, col=color_lines[2])
lines(period$convert_time, period$Sub_metering_3, col=color_lines[3])
legend("topright", legend=labels, col=color_lines, lty="solid")
dev.copy(png,file="plot3.png")
dev.off()
