# read the data 
power_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.string = "?")

# keep only 2007-02-01 and 2007-02-02 data
power_data_subset <- power_data[power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007", ]

# draw a histogram and save as a png file
png("plot1.png", width = 480, height = 480)
hist(power_data_subset$Global_active_power, 
     main = "Global Active Power", ylim = c(0, 1200), col = "grey", 
     xlab = "Global Active Power (kilowatts)")
dev.off()