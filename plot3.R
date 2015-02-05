Columns <- c(rep("character", 2), rep("numeric", 7))
output <- read.table("household_power_consumption.txt", header = TRUE, sep=';', na.strings = "?", colClasses = Columns)
ok <- c(complete.cases(output$Date, output$Time))
output <- output[ok, ]
output$DateTime <- as.POSIXct(paste(output$Date, output$Time), format="%d/%m/%Y %H:%M:%S")
keeps <- c((output$DateTime >= "2007-02-01 00:00:00") & (output$DateTime <= "2007-02-02 24:00:00"))
output <- output[keeps, 7:10]
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(output$DateTime, output$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(output$DateTime, output$Sub_metering_2, type = "l", col = "red")
points(output$DateTime, output$Sub_metering_3, type = "l", col = "blue")
legend('topright', names(output)[c(1:3)],lty=1, col=c('black', 'red', 'blue'))
dev.off()