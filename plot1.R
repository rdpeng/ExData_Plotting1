##sript for chart1
power2 <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")
name <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
names(power2) <- name
power2$DateTime <- strptime(paste(power2$Date, power2$Time), format="%d/%m/%Y %H:%M:%S")
for( i in 3:9 ){
    power2[[i]] <- sapply(power2[[i]], as.character)
    power2[[i]] <- sapply(power2[[i]], as.numeric)
}
win.graph(200,200)
hist(power2$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red", ylim = c(0, 1200))

##save the chart
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
