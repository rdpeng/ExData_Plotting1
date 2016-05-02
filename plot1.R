plot1 <- function(dataset) {

#  globalActivePower <- as.numeric(dataset$Global_active_power)  
#  png("plot1.png", width=480, height=480)  
   hist(dataset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")  
#  dev.off()  

}