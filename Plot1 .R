
### Plot 1

source('load_data.R')

data <- loadData()

png(filename='plot1.png', width=480, height=480, units='px')

hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

dev.off()
