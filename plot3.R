dataset <- read.table('household_power_consumption.txt', sep = ';', header=TRUE)
date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$Date <- date
e <- subset(dataset, dataset$Date=='2007-02-01' | dataset$Date=='2007-02-02')
e$Global_active_power <- as.numeric(e$Global_active_power)
e$DateTime <- as.POSIXct(paste(e$Date, e$Time))

png("plot3.png", width = 480, height = 480)
plot(e$DateTime, e$Sub_metering_1, type= "l", lwd=1, col='red')
lines(e$DateTime, e$Sub_metering_2, type= "l", lwd=1,col='blue')
lines(e$DateTime, e$Sub_metering_3, type= "l", lwd=1)
dev.off()
