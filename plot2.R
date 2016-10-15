plot2 <- function(dataset) {
  
globalActivePower <- as.numeric(dataset$Global_active_power) 
datetime <- strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#png("plot2.png", width=480, height=480)   
plot(datetime,  globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#dev.off

}