my_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data <- my_data[my_data$Date %in% c("1/2/2007", "2/2/2007"),]
png(filename = './figures/plot3.png', width = 480, height = 480, units='px')
plot(data$DateTime, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)