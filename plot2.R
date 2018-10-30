#load in dataset as dataframe
housepower <- read.table('household_power_consumption.txt', stringsAsFactors = FALSE, header = TRUE, sep = ';')

#Take only the portion we are interested in.
Feb2Days <- subset(housepower, housepower$Date == '1/2/2007' | housepower$Date == '2/2/2007')

#Make a 'DateTime' column which combines both Date and Time columns
Feb2Days$DateTime <- strptime(paste(Feb2Days$Date, Feb2Days$Time), format="%d/%m/%Y %H:%M:%S")

#Adjust the Global Active Power to numeric so it plays nice with the plot function
Feb2Days$Global_active_power <- as.numeric(Feb2Days$Global_active_power)

#Lets initialize a png file for our graph
png("plot2.png", width = 480, height = 480)

#and now we'll make the graph itself
plot(Feb2Days$DateTime, Feb2Days$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")

#and close the graphics device
dev.off()
