make_figure_1 <- function()
{
	png('Plot1.png')
	data <- read.table('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?',stringsAsFactors=FALSE)
	data_subset <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
	hist(data_subset$Global_active_power, main='Global Active Power', xlab = 'Global Active Power (kilowatts)', col='red')
	dev.off()
}
