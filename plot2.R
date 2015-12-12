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

## reset plot
par(mfrow=c(1,1))

## create plot - line
plot(hpc_filtered$myDateTime,
     hpc_filtered$Global_active_power, 
     type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
## save plot to working directory
dev.copy(png, 'plot2.png', width=480, height=480)
dev.off()