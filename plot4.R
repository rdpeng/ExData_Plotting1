# Read txt file
DF = read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings=c("?"))

# Subset dataset for the two selected day
DF = DF[DF$Date == "1/2/2007" | DF$Date == "2/2/2007",]

# Convert string to date and time
DF$ExactTime = as.POSIXct(strptime(paste(
  DF$Date, DF$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

# Create plot
png("plot4.png", width = 480, height = 480, units = "px")

# Four plot on one page
par(mfrow = c(2, 2))

with(DF, {
# Plot 1
  # Empty chart
  plot(x=ExactTime, y=Global_active_power,
       type="n", ylab="Global Active Power", xlab="")
  # Draw line
  lines(x=ExactTime, y=Global_active_power, type="l")

# Plot 2
  # Empty chart
  plot(x=ExactTime, y=Voltage,
       type="n", ylab="Voltage", xlab="datetime")
  # Draw line
  lines(x=ExactTime, y=Voltage, type="l")

# Plot 3
  # Empty chart
  plot(x=ExactTime, y=Sub_metering_3,
       type="n", ylab="Energy sub metering", xlab="", ylim=c(0,max(Sub_metering_1,Sub_metering_2,Sub_metering_3, na.rm = T)))
  # Draw lines
  lines(x=ExactTime, y=Sub_metering_1, type="l", col="black")
  lines(x=ExactTime, y=Sub_metering_2, type="l", col="red")
  lines(x=ExactTime, y=Sub_metering_3, type="l", col="blue")
  # Legend
  legend("topright", col = c("black", "red","blue"), lwd=1, lty=1,
         legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty = "n")

# Plot 4
  # Empty chart
  plot(x=ExactTime, y=Global_reactive_power,
       type="n", xlab="datetime")
  # Draw line
  lines(x=ExactTime, y=Global_reactive_power, type="l")
  
})

# Send to file
dev.off()
