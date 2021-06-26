#read the table
my_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
subset <- my_data[my_data$Date %in% c("1/2/2007", "2/2/2007"),]
subset$"Global_active_power" <- as.numeric(subset$"Global_active_power")
#plot the graph
hist(subset$"Global_active_power",col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")