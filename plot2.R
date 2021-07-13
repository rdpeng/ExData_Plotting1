data <- read.table(file.choose(), sep=";", header=TRUE)
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot2.png', width = 480, height = 480, units='px')
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')

