#Download and unzip required subset of the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip")

unzip("household_power_consumption.zip")

require(sqldf)
file <- c("household_power_consumption.txt")
data_subset <- read.csv.sql(file, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

#Construct and save plot 1 (.png file)
dev.copy(png,'plot1.png', width = 480, height = 480)
hist(data_subset$Global_active_power, main = "Global Active Power", xlab= "Global Active Power (kilowatts)", col="red",cex.lab=0.7, cex.axis=0.7, cex.main=0.8, cex.sub=0.75, )
dev.off()
