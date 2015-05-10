## create histogram of global active power
library(sqldf)

## reads only two days of data
power <- read.csv.sql("c:/terry/coursemat/household_power_consumption.csv", 
    sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007' ", 
    header = TRUE, sep = ";")

## sets date from char variables 
power$Date <- as.Date (power$Date, "%d/%m/%Y")

## generates histogram
hist(power$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab = "Frequency", xlim = c(0,6), ylim = c(0,1200))

## save histogram to a png file
dev.copy(png, file = "plot1.png", height = 480, width = 480) 
dev.off() 

