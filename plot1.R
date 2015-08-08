library(sqldf)
histfile <- read.csv.sql('household_power_consumption.txt', sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")
png(file = "plot1.png", bg = "white",width = 480, height = 480, units = "px")
hist(histfile$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power(kilowatts)") 
dev.off ();