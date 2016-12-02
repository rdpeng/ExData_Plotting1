#Plot 1
plot_Data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
period <- plot_Data[plot_Data$Date %in% c("1/2/2007","2/2/2007"),]
convert_time <-strptime(paste(period$Date, period$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
period <- cbind(convert_time, period)
hist(period$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()
