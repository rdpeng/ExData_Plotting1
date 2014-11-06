# load data and headers
setwd("C:/Users/DE-77691/Documents/1_Work/Tasks/Coursera/Lec4/W1/")
household_power_consumption <- read.table('household_power_consumption.txt', header=T, sep=';', skip=66637, nrows=2880)
header <- read.table('household_power_consumption.txt', header=T, sep=';', nrows=1)
colnames(household_power_consumption) <- colnames(header)

#create timestamp
data$Timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot4.png")

# set 2x2 plot
par(mfrow=c(2,2))
  #create line plot for top left
  plot(data$Timestamp, data$Global_active_power, xlab="", ylab="Global Active Power", type='l')
  
  #create line plot for top right
  plot(data$Timestamp, data$Voltage, xlab="datetime", ylab="Voltage", type='l')
  
  #create plot for bottom left with 3 lines and legend for this plot
  plot(data$Timestamp, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type='l')
  lines(data$Timestamp, data$Sub_metering_2, col='red')
  lines(data$Timestamp, data$Sub_metering_3, col='blue')
  legend("topright", col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1)
  
  #create plot for bottom right
  plot(data$Timestamp, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type='l')


dev.off()