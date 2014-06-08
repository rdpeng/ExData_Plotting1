## plot 1 
##read data
library(datasets)
household_power_consumption <- read.csv("~/Desktop/Coursera/
                                        household_power_consumption.txt", 
                                        sep=";")
## create histogram of Global Active Power with red bars, rename title, 
## and rename x axis
hist(household_power_consumption$Global_active_power, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")


## save as PNG
png(filename='plot1.png', width = 480, height = 480)
hist(household_power_consumption$Global_active_power, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
setwd('/Users/cberryma/Desktop/Coursera/')
dev.off()
