getwd()
setwd("./Course4")

twoday_power <- read.csv(file = "Feb2DayPower.csv")

png("plot1.png", width=480, height=480)
hist(twoday_power$Global_active_power,col = "red", 
     main = "Global Active Power",
     xlab= "Global Active Power (kilowatts)",
     ylim = c(0,1200))

dev.off()
