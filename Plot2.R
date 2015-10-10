setwd("~/Documents/Research/Research_Courses/Coursera - Explore")

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                    na.strings = "?", colClasses = c("character", "character", "numeric", 
                                                     "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
pow_subp1 <- power[power$Date == "1/2/2007",]
pow_subp2 <- power[power$Date == "2/2/2007",]
power_sub <- rbind(pow_subp1, pow_subp2)
DateTime <- data.frame()
DateTime <- paste(power_sub$Date, power_sub$Time)
power_sub <- cbind(DateTime, power_sub)
power_sub$Date <- NULL
power_sub$Time <- NULL
power_sub$DateTime <- strptime(power_sub$DateTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png")

plot(power_sub$DateTime, power_sub$Global_active_power, type = "n",
     cex.lab = 0.75, cex.axis = 0.75,
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(power_sub$DateTime, power_sub$Global_active_power)

dev.off()
