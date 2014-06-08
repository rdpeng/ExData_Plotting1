## plot 3
## read data and create column for DateTime
library(datasets)
household_power_consumption <- read.csv("~/Desktop/Coursera/
                                        household_power_consumption.txt",sep=";")
dateTime <- strptime((paste(household_power_consumption$Date, 
                            household_power_consumption$Time, sep=" ")), 
                     "%d/%m/%Y %H:%M:%S")
data <- cbind(dateTime, household_power_consumption)
colnames(data)[1] <- "DateTime"
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## create plot for energy submetering 1,2,3 for Thurs-Fri
plot(data2$DateTime, data2$Sub_metering_1, xlab=" ", ylab="Energy Sub Metering", 
     type="l", col="black")
lines(data2$DateTime, data2$Sub_metering_2, col="red")
lines(data2$DateTime, data2$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1))

## save as PNG
png(filename='plot3.png', width = 480, height = 480)
plot(data2$DateTime, data2$Sub_metering_1, xlab=" ", ylab="Energy Sub Metering", 
     type="l", col="black")
lines(data2$DateTime, data2$Sub_metering_2, col="red")
lines(data2$DateTime, data2$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1))
setwd('/Users/cberryma/Desktop/Coursera/')
dev.off()
