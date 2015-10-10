setwd("~/Documents/Research/Research_Courses/Coursera - Explore")

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                    na.strings = "?", colClasses = c("factor", "factor", "numeric", 
                    "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
pow_subp1 <- power[power$Date == "1/2/2007",]
pow_subp2 <- power[power$Date == "2/2/2007",]
power_sub <- rbind(pow_subp1, pow_subp2)

hist(power_sub$Global_active_power, breaks = 12, col = "red", 
        xlab = "Global Active Power (kilowatts)",
        main = "Global Active Power", cex.lab = 0.75, 
        cex.axis = 0.75, cex.main = 0.85)

dev.copy(png, file = "plot1.png")
dev.off()
