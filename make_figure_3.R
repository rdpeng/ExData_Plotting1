make_figure_3 <- function()
{
	png('Plot3.png')
	data <- read.table('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?',stringsAsFactors=FALSE)
	data_subset <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
	plot(1:2880, data_subset$Sub_metering_1, ylab='Energy sub metering', type='l', xaxt='n', xlab='')
	with(data_subset, lines(1:2880, Sub_metering_2, type='l', col='red'))
	with(data_subset, lines(1:2880, Sub_metering_3, type='l', col='blue'))
	axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))
	legend('topright', lty=c(1,1,1), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black','red','blue'))
	dev.off()
} 
