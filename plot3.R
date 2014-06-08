# Loading data - assumes that the data file is within the current working directory
# Subsets to only take the data during the interested time frame
data <- read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')

# Changes the formatting of the date and time 
data$fullDateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
data$Day <- format(data$fullDateTime, "%A")

png(filename = "plot3.png", width = 480, height = 480, units="px")

# Graphs each of the three lines individually 
plot(data$fullDateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$fullDateTime, as.numeric(as.character(data$Sub_metering_2)), type = "l", col = "red")
lines(data$fullDateTime, as.numeric(as.character(data$Sub_metering_3)), type = "l", col = "blue")

# Writes the legend
legend("topright", lty = 1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
