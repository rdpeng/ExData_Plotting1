hpower <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = T)

hpower1 <- hpower[hpower$Date == "1/2/2007"| hpower$Date == "2/2/2007", ]

png("plot3.png")

day <- strptime(paste(hpower1$Date, hpower1$Time ), "%d/%m/%Y %H:%M:%S")


plot(day, as.numeric (hpower1$Sub_metering_1), type= "l", xlab = "", ylab ="Energy sub metering" )

lines(day, as.numeric (hpower1$Sub_metering_2), type = "l", col = "red")

lines(day, as.numeric (hpower1$Sub_metering_3), type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))


dev.off()