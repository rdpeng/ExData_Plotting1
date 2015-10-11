make_figure_2 <- function()
{
	png('Plot2.png')
	data <- read.table('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?',stringsAsFactors=FALSE)
	data_subset <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
	plot(1:2880, data_subset$Global_active_power, ylab='Global Active Power (kilowatts)', type='l', xaxt='n', xlab='')
	axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))
	dev.off()
} 
