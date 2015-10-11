
original <- read.table('household_power_consumption.txt', sep=';', header = T)

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
## One alternative is to read the data from just those dates rather than
## reading in the entire dataset and subsetting to those dates.

# strptime, as.Date() functions!
original$Date <- as.Date(original$Date, '%d/%m/%Y')
original$Time <- strptime(original$Time, '%T') 

febone <- unclass(as.Date('2007-02-01'))
febsec <- unclass(as.Date('2007-02-02'))
filtered<- subset(original, unclass(original$Date) %in% c(febone,febsec)) # subset the two dates

x <- as.numeric(as.vector(filtered$Global_active_power)) # because Global Active Power is in Factor form,
                                                         # convert to vector and then to numeric


# plot and output to graphic file device

png(file = 'plot1.png', width = 480, height = 480)
par(fin = c(480*1/96, 480*1/96), mar = c(4,3,3,2)) # par accepts inches - 1/96 inch = 1 pixel
hist(x, xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     main = "Global Active Power", col = "red", yaxs = 'r')
dev.off()