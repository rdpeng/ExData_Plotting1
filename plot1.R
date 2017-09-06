## Read in the raw table
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", dec = '.', stringsAsFactors = FALSE)

## Format date and restrict dataset to Feb 1st and 2nd of 2007
data$Date <- as.Date(data$Date, "%d/%m/%Y")
date_subset <- data[(data$Date >= '2007-02-01' & data$Date <= '2007-02-02'), ]

## Create numeric vector of the global_active_power variable
global_act_power <- as.numeric(date_subset$Global_active_power)

## Create histogram of 'Global Active Power (kilowatts)'
png("plot1.png", width=480, height=480)
hist(global_act_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
