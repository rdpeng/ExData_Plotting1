#load in dataset as dataframe
housepower <- read.table('household_power_consumption.txt', stringsAsFactors = FALSE, header = TRUE, sep = ';')

#Take only the portion we are interested in.
Feb2Days <- subset(housepower, housepower$Date == '1/2/2007' | housepower$Date == '2/2/2007')

#Make relevant column numeric
Feb2Days$Global_active_power <- as.numeric(Feb2Days$Global_active_power)

#initialize a png-type graphics device
png("plot1.png", width = 480, height = 480)

#And finally make the graph
hist(Feb2Days$Global_active_power,
     col = 'red',
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)',
     breaks = 20)


#and close the graphics device
dev.off()
