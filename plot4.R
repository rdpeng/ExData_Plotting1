my_data <- read.table('household_power_consumption.txt', header=TRUE, sep = ";", 
                      dec = ".", na.strings = "?", colClasses = c(NA, NA, rep ("numeric", 7)))
date1 <- as.Date("01/02/2007","%d/%m/%Y")
date2 <- as.Date("02/02/2007", "%d/%m/%Y")
date_table <- as.Date(my_data$Date, "%d/%m/%Y")

hpc <- my_data[date_table>=date1 & date_table<=date2,]

png("plot4.png", width=480, height=480)

date_time <- paste(hpc$Date,hpc$Time)
dt <- strptime(date_time, format="%d/%m/%Y %H:%M:%S")
par(mfcol=c(2,2))
#Plot 2
plot(dt,
     hpc$Global_active_power,
     type="l",
     col=I("black"), 
     main = "",
     xlab = "",
     ylab="Global Active Power")
#Plot 3
plot(dt,
     hpc$Sub_metering_1,
     type="l",
     col=I("black"), 
     main = "",
     xlab = "",
     ylab="Energy sub metering")
lines(dt, hpc$Sub_metering_2, type="l", col="red")
lines(dt, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black", "red", "blue"), lty = 1:1, cex = 0.8, bty = "n")
#Plot 4
plot(dt,
     hpc$Voltage,
     type="l",
     col=I("black"), 
     main = "",
     xlab = "datetime",
     ylab="Voltage")
#Plot 5
plot(dt,
     hpc$Global_reactive_power,
     type="l",
     col=I("black"), 
     main = "",
     xlab = "datetime",
     ylab="Global_reactive_power")
dev.off()

