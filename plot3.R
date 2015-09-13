# Plot 3

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Preparing the Data for visualization
dateTime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobActPow <- as.numeric(subSet$Global_active_power)
sub_1 <- as.numeric(subSet$Sub_metering_1)
sub_2 <- as.numeric(subSet$Sub_metering_2)
sub_3 <- as.numeric(subSet$Sub_metering_3)

# Drawing the Plot
png("plot3.png", width=480, height=480)
plot(dateTime, sub_1, type="l", xlab="", ylab="Energy Submetering")
lines(dateTime, sub_2, type="l", col="red")
lines(dateTime, sub_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"))
dev.off()