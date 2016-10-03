## Read in the data
epcfull <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")

## pull out the dates and times and make a single POSIXct column of date and time
dates <- epcfull$Date
times <- epcfull$Time
x <- paste(dates,times)
dt <- as.POSIXct(x, format = "%d/%m/%Y %H:%M:%S")
epc <- cbind(dt, epcfull)

## Pull out the days in question 
beg <- as.POSIXct("2007-02-01")
end <- as.POSIXct("2007-02-03")
epc <- subset(epc,epc$dt>=beg & epc$dt < end)

## make the Global_active_power column numeric
epc$Global_active_power <- as.numeric(epc$Global_active_power)

## Read in the data
epcfull <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")

## pull out the dates and times and make a single POSIXct column of date and time
dates <- epcfull$Date
times <- epcfull$Time
x <- paste(dates,times)
dt <- as.POSIXct(x, format = "%d/%m/%Y %H:%M:%S")
epc <- cbind(dt, epcfull)

## Pull out the days in question 
beg <- as.POSIXct("2007-02-01")
end <- as.POSIXct("2007-02-03")
epc <- subset(epc,epc$dt>=beg & epc$dt < end)

## make the Global_active_power column numeric
epc$Global_active_power <- as.numeric(epc$Global_active_power)

## Set up file to save PNG in
png('plot2.png, width = 400, height = 400')

## Initiate the Plot
plot(epc$dt, epc$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (Kilowatts)")
lines(epc$dt, epc$Global_active_power)

dev.off()