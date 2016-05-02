library(lubridate)

setwd("C:/Users/JP/Desktop/Data Science Cert/4.- Exploratory Data Analysis/Project 1")

x <- read.csv2("household_power_consumption.txt")

x1 <- subset(x, dmy(x$Date) == "2007-02-01")
x2 <- subset(x, dmy(x$Date) == "2007-02-02")

x <- rbind(x1,x2)

datetime <- strptime(paste(x$Date,x$Time,sep = " "), "%d/%m/%Y %H:%M:%S")

SubMetering1 <- as.numeric(as.character(x$Sub_metering_1))
SubMetering2 <- as.numeric(as.character(x$Sub_metering_2))
SubMetering3 <- as.numeric(as.character(x$Sub_metering_3))

plot(datetime, SubMetering1,type = "l", ylab = "Energy Submetering",xlab = "")
lines(datetime, SubMetering2,type = "l", col = "red")
lines(datetime, SubMetering3,type = "l", col = "blue")

legend("topright", c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), lty = 1, lwd = 2.5, col = c("black","red","blue"))

dev.copy(png,"plot3.png")
dev.off()