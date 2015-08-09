# Read Data
pc <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract needed dataset
pc <- pc[(pc$Date=="1/2/2007" | pc$Date=="2/2/2007"),]

# Combine Date and Time
pc$DateTime <- 
  strptime(paste(pc$Date, pc$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S" )

# Open png device
png("plot2.png", width=480, height=480)

# Plot the graph
plot(pc$DateTime, pc$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
 
dev.off()