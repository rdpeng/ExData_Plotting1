library(lubridate)

setwd("C:/Users/JP/Desktop/Data Science Cert/4.- Exploratory Data Analysis/Project 1")

x <- read.csv2("household_power_consumption.txt")

x1 <- subset(x, dmy(x$Date) == "2007-02-01")
x2 <- subset(x, dmy(x$Date) == "2007-02-02")

x <- rbind(x1,x2)

datetime <- strptime(paste(x$Date,x$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(as.character(x$Global_active_power))

plot(datetime, GlobalActivePower,type = "l", ylab = "Global Active Power",xlab = "Global Active Power (kilowatts)")

dev.copy(png,"plot2.png")
dev.off()
