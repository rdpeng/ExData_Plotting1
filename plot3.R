## clear variables
rm(list = ls())

finalDest <- "exdata-data-household_power_consumption"
dwnldFile <- "exdata-data-household_power_consumption.zip"
finalFile <- "exdata-data-household_power_consumption/household_power_consumption.txt"
if(!file.exists(dwnldFile)) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dwnldFile)
}
file <- unzip(dwnldFile, exdir =  finalDest, overwrite = TRUE)
unlink(dwnldFile)


## code for reading the data
hpc <- read.csv(finalFile, header = TRUE, sep = ";")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
## filter dates 2007-02-01 and 2007-02-02
hpc_filtered <- subset(hpc, hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02")
rm("hpc")
## convert from date/time factors to date/time column and add
myDateTime <- paste(as.character(hpc_filtered$Date), as.character(hpc_filtered$Time))
myDateTime <- strptime(myDateTime, "%Y-%m-%d %H:%M:%S")
hpc_filtered <- cbind(hpc_filtered, myDateTime)
## change active power to numeric so we can plot
hpc_filtered$Global_active_power <- as.numeric(as.character(hpc_filtered$Global_active_power))
hpc_filtered$Sub_metering_1 <- as.numeric(as.character(hpc_filtered$Sub_metering_1))
hpc_filtered$Sub_metering_2 <- as.numeric(as.character(hpc_filtered$Sub_metering_2))
hpc_filtered$Sub_metering_3 <- as.numeric(as.character(hpc_filtered$Sub_metering_3))

## reset plot
par(mfrow=c(1,1))

## create plot - combination
plot(hpc_filtered$myDateTime,
     hpc_filtered$Sub_metering_1, 
     type="l", xlab="", ylab="Energy sub metering")
lines(hpc_filtered$myDateTime,hpc_filtered$Sub_metering_2,col="red")
lines(hpc_filtered$myDateTime,hpc_filtered$Sub_metering_3,col="blue")
legend("topright", 
       col=c("black","red","blue"), 
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1))
## save plot to working directory
dev.copy(png, 'plot3.png', width=480, height=480)
dev.off()
