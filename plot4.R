# Loading data - assumes that the data file is within the current working directory
# Subsets to only take the data during the interested time frame
data <- read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')

# Changes the formatting of the date and time 
data$fullDateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
data$Day <- format(data$fullDateTime, "%A")

png(filename = "plot4.png", width = 480, height = 480, units="px")

# Graphs each of the three lines individually 
par(mfrow = c(2, 2))
with(data, { 
  # first plot: Global active power vs. datetime 
  plot(fullDateTime, Global_active_power, type = "l", ylab="Global Active Power", xlab="")
  
  # second plot: Voltage vs. datetime
  plot(fullDateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  
  # third plot: Energy sub metering vs. datetime 
  plot(fullDateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(fullDateTime, as.numeric(as.character(Sub_metering_2)), type = "l", col = "red")
  lines(fullDateTime, as.numeric(as.character(Sub_metering_3)), type = "l", col = "blue")
  legend("topright", lty = 1, col=c("black", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #fourth plot: Global reactive power vs. datetime
  plot(fullDateTime, Global_reactive_power, type="l", xlab="datetime")
})

dev.off()