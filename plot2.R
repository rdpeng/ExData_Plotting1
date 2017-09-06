## Read in the raw table
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", dec = '.', stringsAsFactors = FALSE)

## Format date and restrict dataset to Feb 1st and 2nd of 2007
data$Date <- as.Date(data$Date, "%d/%m/%Y")
date_subset <- data[(data$Date >= '2007-02-01' & data$Date <= '2007-02-02'), ]

## Create numeric vector of the global_active_power variable
global_act_power <- as.numeric(date_subset$Global_active_power)

## Create datetime variable
datetime <- strptime(paste(date_subset$Date, date_subset$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

## Create plot of global active power over the two day period
png("plot2.png", width=480, height=480)
plot(datetime, global_act_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()
