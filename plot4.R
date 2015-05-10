## create histogram of global active power
library(sqldf)

## reads only two days of data
power <- read.csv.sql("c:/terry/coursemat/household_power_consumption.csv", 
                      sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007' ", 
                      header = TRUE, sep = ";")

par(mfcol = c(2,2))

## original plot 2
## sets date from char variables 
power$Date <- as.Date (power$Date, "%d/%m/%Y")
plot(power4$DateTime, power4$Global_active_power, type = "l", xlab= " " , ylab = "Global Active Power", ylim = c(0,6))

## original plot 3
x <- power4$DateTime
y <- power4$Sub_metering_1
plot(x = power4$DateTime, y = power4$Sub_metering_1, ylab="Energy sub meering", xlab = "", type = "l", col = "black")
y <- power4$Sub_metering_2
lines(x,y, col="red")
y <- power4$Sub_metering_3
lines(x,y, col="blue")

# add a legend 
legend('topright','groups',c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1),
       col=c('black','red','blue'), ncol = 1, bty = "n", cex=0.55, xjust=1) 

## new plot Voltage
plot(power4$DateTime, power4$Voltage, type = "l", xlab= "datetime", ylab = "Voltage", ylim = c(234,246))

## new plot Global Reactive Power
plot(power4$DateTime, power4$Global_reactive_power, type = "l", xlab= "datetime", ylab = "Global_reactive_power", ylim = c(0,.5))

## save plot to a png file
dev.copy(png, file = "plot4.png", height = 480, width = 480) 
dev.off() 
