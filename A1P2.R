#### R scipt to create plot 2
## Load package
library(lubridate)

## Read Data and turn into datetime
coltype=c(rep("character",2), rep("numeric",7))
data <- read.table("household_power_consumption.txt", header = T, sep = ';', 
                   colClasses = coltype, na.strings = "?")
data$Date <- strptime(data$Date, "%d/%m/%Y")

## Extract only 2007/02/01 and 2007/02/02
bool<-data$Date == as.POSIXct('2007-02-01') | data$Date == as.POSIXct('2007-02-02')
data <- data[bool,]

## Create datetime column and put it into the format ymdhms
data$Date_time <- paste(data$Date, data$Time)
data$Date_time <- ymd_hms(data$Date_time)

##plot
png("plot2.png", width = 480, height = 480, units = "px", pointsize = 12)
with(data, plot(Date_time, Global_active_power, type = "S",
                xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()