# load data and header information
setwd("C:/Users/DE-77691/Documents/1_Work/Tasks/Coursera/Lec4/W1/")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=';', skip=66637, nrows=2880)
header <- read.table("household_power_consumption.txt", header=TRUE, sep=';', nrows=1)
colnames(data) <- colnames(header)

#create png file
png(filename="plot2.png")

#convert date and time to timestamp
data$Timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# plot global active power
plot(data$Timestamp, data$Global_active_power, xlab="", ylab="Global Active Power(kilowatts)", type="l")

dev.off()