## Read in the data
epcfull <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")

## Set the dates column to char class to set up the subselection
dt <- as.character(epcfull$Date)
epc <- cbind(dt, epcfull)

## subselect the days we are interested in
epc <- subset(epc,epc$dt =="1/2/2007" | epc$dt == "2/2/2007")

## Create a POSIXct column for easier analysis
epc$Time <- as.character(epc$Time)
epc$dt <- strptime(paste(epc$d, epc$Time, sep =" "),format = "%d/%m/%Y %H:%M:%S")

## make the Global_active_power column numeric
epc$Global_active_power <- as.numeric(as.character(epc$Global_active_power))

## Set up file to save PNG in
png('plot2.png, width = 480, height = 480')

## Initiate the Plot
plot(epc$dt, epc$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (Kilowatts)")
lines(epc$dt, epc$Global_active_power)

dev.off()