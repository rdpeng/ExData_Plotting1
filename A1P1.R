library(ggplot2)
coltype=c(rep("character",2), rep("numeric",7))
data <- read.table("household_power_consumption.txt", header = T, sep = ';', 
                   colClasses = coltype, na.strings = "?")
data$Date <- strptime(data$Date, "%d/%m/%Y")
bool<-data$Date == as.POSIXct('2007-02-01') | data$Date == as.POSIXct('2007-02-02')
data <- data[bool,]
png("plot1.png", width = 480, height = 480, units = "px", pointsize = 12)
hist(data$Global_active_power, binwidth = 0.5, col = 'red', main = 'Global Active Power',
     xlab = "Global Active Power (kilowatts)")
dev.off()
