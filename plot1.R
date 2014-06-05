setwd("C:/Users/558966/Documents/Coursera")
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses = c("factor", "factor","numeric", "numeric", "numeric", "numeric","numeric","numeric","numeric"))

data$date.new <- as.Date(data$Date, format ="%d/%m/%Y")
data.new <- subset(data, data$date.new >= '2007-02-01' & data$date.new <= '2007-02-02')

hist(data.new$Global_active_power, col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power", ylim = c(0,1200))
dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()
