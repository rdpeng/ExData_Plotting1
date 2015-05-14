## Project 1 for Exploratory Data Analysis

data = read.table("household_power_consumption.txt",header=T, sep=";")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(data$Time,"%H:%M:%S")

sub <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02" ) # using data from the dates 2007-02-01 and 2007-02-02
power <- as.numeric(as.character(sub$Global_active_power)) # convert factor to numeric
png("plot1.png", width = 480, height = 480, units = "px")
hist(power ,col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power",ylim = c(0,1250))
dev.off() 
