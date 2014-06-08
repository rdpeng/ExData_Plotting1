## plot 2 
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

## create plot of global active power over 2 days
plot(data2$DateTime, data2$Global_active_power, main=" ", type="l", col ="black", 
     ylab="Global Active Power (kilowatts)", xlab=" ")

## save as PNG
png(filename='plot2.png', width = 480, height = 480)
plot(data2$DateTime, data2$Global_active_power, main=" ", type="l", col ="black", 
     ylab="Global Active Power (kilowatts)", xlab=" ")
setwd('/Users/cberryma/Desktop/Coursera/')
dev.off()