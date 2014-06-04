# working directory is 'ExData_Plotting1/'
# data is in working directory
epc <- read.csv('household_power_consumption.txt', sep=';')
epc <- epc[epc$Date=='2/2/2007' | epc$Date=='1/2/2007',]

# suppressing warnings because ?'s are casted to NAs
epc$Global_active_power <- suppressWarnings(as.numeric(as.character(epc$Global_active_power)))

png(filename='plots/plot1.png', width=480, height=480)
hist(epc$Global_active_power, xlab='Global Active Power (kilowatts)', main='Global Active Power', col='red', xlim=c(0, 6))
dev.off()
