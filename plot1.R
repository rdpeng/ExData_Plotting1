# Read txt file
DF = read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F, na.strings=c("?"))

# Subset dataset for the two selected day
DF = DF[DF$Date == "1/2/2007" | DF$Date == "2/2/2007",]

# Convert string to date and time
DF$ExactTime = as.POSIXct(strptime(paste(
  DF$Date, DF$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

# Create plot
png("plot1.png", width = 480, height = 480, units = "px")

# Create histogram
hist(DF$Global_active_power, 
     xlab="Global Active Power (kilowatts)", col="red",
     main="Global Active Power")

# Send to file
dev.off()
