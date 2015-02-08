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

#Construct and save plot 4 (.png file)
dev.copy(png,'plot4.png', width = 480, height = 480)
par(mfrow = c(2,2))
plot(data_subset$Time, data_subset$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
plot(data_subset$Time, data_subset$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(data_subset$Time, data_subset$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l",)
  lines(data_subset$Time, data_subset$Sub_metering_2, col='red')
  lines(data_subset$Time, data_subset$Sub_metering_3, col='blue')
  legend('topright',
       legend=c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'),
       col=c('black','red','blue'),
       lty='solid')
plot(data_subset$Time, data_subset$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()
