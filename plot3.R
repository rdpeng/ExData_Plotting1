library(sqldf)
power4 <- read.csv.sql("c:/terry/coursemat/household_power_consumption.csv", 
    sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007' ", 
    header = TRUE, sep = ";")

power4$Date <- as.Date (power4$Date, "%d/%m/%Y")
power4$DateTime <- as.POSIXct(strptime(paste(power4$Date, power4$Time), "%Y-%m-%d %H:%M:%S"))

 x <- power4$DateTime
 y <- power4$Sub_metering_1
 plot(x = power4$DateTime, y = power4$Sub_metering_1, ylab="Energy sub meering", xlab = "", type = "l", col = "black")
 y <- power4$Sub_metering_2
 lines(x,y, col="red")
 y <- power4$Sub_metering_3
 lines(x,y, col="blue")
 
 # add a legend 
 legend('topright','groups',c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1),
     col=c('black','red','blue'), ncol=1, cex=0.85, xjust=1)             
  	
 ## save histogram to a png file
 dev.copy(png, file = "plot3.png", height = 480, width = 480) 
 dev.off() 
