library(lubridate)

setwd("C:/Users/JP/Desktop/Data Science Cert/4.- Exploratory Data Analysis/Project 1")

x <- read.csv2("household_power_consumption.txt")

x1 <- subset(x, dmy(x$Date) == "2007-02-01")
x2 <- subset(x, dmy(x$Date) == "2007-02-02")

x <- rbind(x1,x2)

hist(as.numeric(as.character(x$Global_active_power)),col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

dev.copy(png,"plot1.png")
dev.off()
