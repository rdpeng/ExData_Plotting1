# load data and headers
setwd("C:/Users/DE-77691/Documents/1_Work/Tasks/Coursera/Lec4/W1/")
data <- read.table('household_power_consumption.txt', header=TRUE, sep=';', skip=66637, nrows=2880)
header <- read.table('household_power_consumption.txt', header=TRUE, sep=';', nrows=1)
colnames(data) <- colnames(header)

#convert Date and Time to Timestamps
data$Timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#create png file
png(filename="plot3.png")

# plot line for sub_meterin1 and name the y axis
plot(data$Timestamp, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type='l')
# add lines for sub_metering_2 and _3
lines(data$Timestamp, data$Sub_metering_2, col='red')
lines(data$Timestamp, data$Sub_metering_3, col='blue')

# create legend
legend("topright", col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1)

dev.off()