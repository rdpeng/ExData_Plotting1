Sys.setlocale("LC_TIME","eng")
library(dplyr)
# missing values are coded as "?" - NA ë¡? ë°”ê¿”?†”?•¼ê² ë‹¤.
original <- read.table('household_power_consumption.txt', sep=';', header = T)

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
## One alternative is to read the data from just those dates rather than
## reading in the entire dataset and subsetting to those dates.


original$Date <- as.Date(original$Date, '%d/%m/%Y')

febone <- unclass(as.Date('2007-02-01'))
febsec <- unclass(as.Date('2007-02-02'))
filtered<- subset(original, unclass(original$Date) %in% c(febone,febsec)) 

filtered$DateTime <- paste(filtered$Date, filtered$Time)
filtered$DateTime <- strptime(filtered$DateTime, '%Y-%m-%d %T', tz='UTC')
y <- as.numeric(as.vector(filtered$Global_active_power)) 
x <- filtered$DateTime

# plot and output to graphic file device
png(file = 'plot2.png', width = 480, height = 480)
par(fin = c(480*1/96, 480*1/96), mar = c(3,4,2,1)) # par accepts inches - 1/96 inch = 1 pixel
plot(x, y, type = 'l', ylab= "Global Active Power (kilowatts)", xlab=NA)
dev.off()