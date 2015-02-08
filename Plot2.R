#Download and unzip required subset of the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip")

unzip("household_power_consumption.zip")

require(sqldf)
file <- c("household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

#Convert Date and Time Variables to Date/Time Classes
data_subset$Date <- as.Date(data_subset$Date , "%d/%m/%Y")
data_subset$Time <- paste(data_subset$Date, data_subset$Time, sep=" ")
data_subset$Time <- strptime(data_subset$Time, "%Y-%m-%d %H:%M:%S")

#Construct and save plot 2 (.png file)
dev.copy(png,'plot2.png', width = 480, height = 480)
plot(data_subset$Time, data_subset$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l",)
dev.off()
