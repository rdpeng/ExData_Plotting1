table<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";")
table$Date<-as.Date(table$Date, format = "%d/%m/%Y")
subset<-subset(table, table$Date == as.Date("2007-02-01") | table$Date == as.Date("2007-02-02"))
png(filename="plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(as.numeric(subset$Global_active_power)/1000, type = "l", ylab = "Global Active Power", xlab = "" ,yaxt= "n", xaxt = "n")
axis(side=2, at=seq(0,3,1), labels = seq(0,6,2))
axis(side = 1, at=seq(0, 2880, 1440), labels = c("Thu", "Fri", "Sat"))

plot(as.numeric(as.character(subset$Voltage)), type = "l", ylab = "Voltage", xlab = "datetime" , xaxt = "n")
axis(side = 1, at=seq(0, 2880, 1440), labels = c("Thu", "Fri", "Sat"))

plot(as.numeric(as.character(subset$Sub_metering_1)), type = "l", ylab = "Energy sub metering", xlab = "", xaxt='n', yaxt = 'n')
legend("topright",lwd = 1 , col = c("black", "red", "blue"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
lines(as.numeric(as.character(subset$Sub_metering_2)), col = "red")
lines(as.numeric(as.character(subset$Sub_metering_3)), col = "blue")
axis(side = 1, at=seq(0, 2880, 1440), labels = c("Thu", "Fri", "Sat"))
axis(side=2, at=seq(0,30, 5), labels = seq(0,30, 5))

plot(as.numeric(as.character(subset$Global_reactive_power)), type = "l", ylab = "Global_reactive_power", xlab = "datetime" , xaxt = "n")
axis(side = 1, at=seq(0, 2880, 1440), labels = c("Thu", "Fri", "Sat"))
dev.off()

