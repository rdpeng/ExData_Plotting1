#### set working directory ###

setwd("C:\\Temp\\Coursera\\Exploratory Data Analysis\\Data")

### Read in household power consumption text file ###
# ';' is the delimiter
# '?' is the NULL character
# Date and Time columns will be converted to single date/time stamp column

data <- read.csv("household_power_consumption.txt", sep=";",
                 colClasses=c(rep("character",1),
                              rep("character",2)),
                 na.strings="?")

### Create datetime column from the Date and Time columns ###
data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

### Subset data to read from the dates 2007-02-01 and 2007-02-02 ###

data_subset = subset(data,
                     as.Date(data$DateTime) >= "2007-02-01" & 
                       as.Date(data$DateTime) <= "2007-02-02")

# Convert columns to numeric
for(i in c(3:9)) {data_subset[,i] <- as.numeric(as.character(data_subset[,i]))}

### Plot 4 ###
# Start PNG device, 480 x 480 pixels

png(filename="plot4.png", height=480, width=480, units = "px", bg="transparent")

# Create 2 x 2 charts
par(mfrow=c(2,2))

# Top Left Plot
plot(data_subset$DateTime, data_subset$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

# Top Right Plot
plot(data_subset$DateTime, data_subset$Voltage, type="l",xlab="datetime", ylab="Voltage")

# Bottom Left Plot
# Create Plot and line for sub_metering_1
plot(data_subset$DateTime, data_subset$Sub_metering_1, col="black", xlab = "", ylab = "Energy sub metering", type="l")
# Line for sub_metering_2
lines(data_subset$DateTime, data_subset$Sub_metering_2, col = "red")
# Line for sub_metering_3
lines(data_subset$DateTime, data_subset$Sub_metering_3, col = "blue")
# Legend attributes for plot
legend("topright", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),box.lwd=0, bty="n")

# Bottom Right Plot
plot(data_subset$DateTime, data_subset$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")
lines(data_subset$DateTime, data_subset$Global_reactive_power)

# Close device and save file
dev.off()
