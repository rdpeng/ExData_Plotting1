library(sqldf)
power4 <- read.csv.sql("c:/terry/coursemat/household_power_consumption.csv", 
    sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007' ", 
    header = TRUE, sep = ";")
 
power4$Date <- as.Date (power4$Date, "%d/%m/%Y")
power4$DateTime <- as.POSIXct(strptime(paste(power4$Date, power4$Time), "%Y-%m-%d %H:%M:%S"))

plot(power4$DateTime, power4$Global_active_power, type = "l", xlab= " " , ylab = "Global Active Power (kilowatts)", ylim = c(0,6))

## save plot to a png file
dev.copy(png, file = "plot2.png", height = 480, width = 480) 
dev.off() 
