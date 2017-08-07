#Loading information and generating data set filtered by date
datoenergy <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', 
                         colClasses = c("character", "character", rep("numeric",7)), 
                         na = "?")

datoenergy$Date <- as.Date(datoenergy$Date, "%d/%m/%Y")
subdatenerg <- subset(datoenergy, Date == "2007-02-01" | Date == "2007-02-02")

#Create the DateTime variable for the x-axis (union Date&Time)
subdatenerg$DateTime <- as.POSIXct(paste(subdatenerg$Date, subdatenerg$Time))

#GRAPHIC 4
png(filename = "plot4.png", width = 480, height = 480, units = 'px')
par(mfrow = c(2,2))

# Graphic 1: position (1,1)
plot(subdatenerg$DateTime, subdatenerg$Global_active_power, 
     ylab = "Global Active Power", xlab = "", type = 'l')

# Graphic 2: position (1,2)
plot(subdatenerg$DateTime, subdatenerg$Voltage, xlab = "datetime",
     ylab = "Voltage", type = "l")

# Graphic 3: position (2,1)
plot(subdatenerg$DateTime, subdatenerg$Sub_metering_1, 
     ylab = "Energy sub metering", xlab = "", type = 'l')
lines(subdatenerg$DateTime, subdatenerg$Sub_metering_2, col = "red")
lines(subdatenerg$DateTime, subdatenerg$Sub_metering_3, col = "blue")
legend('topright', col = c("black", "red", "blue"), legend = 
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1)

#Graphic 4: position (2,2)
plot(subdatenerg$DateTime, subdatenerg$Global_reactive_power,
     xlab = "datetime", ylab = "Global_reactive_power", type = "l")

# close device
dev.off()