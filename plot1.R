source('plot.common.R')

plot.one <- function(data.directory)
{    
    png(filename = 'plot1.png')
    power.data <- read.power.consumption.data(data.directory)
    hist(power.data$V3, xlab = 'Global Active Power (kilowatts)', col = 'red',
         main = 'Global Active Power')    
    dev.off()
}
