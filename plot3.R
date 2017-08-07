#Loading information and generating data set filtered by date
datoenergy <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', 
                         colClasses = c("character", "character", rep("numeric",7)), 
                         na = "?")

datoenergy$Date <- as.Date(datoenergy$Date, "%d/%m/%Y")
subdatenerg <- subset(datoenergy, Date == "2007-02-01" | Date == "2007-02-02")

#Create the DateTime variable for the x-axis (union Date&Time)
subdatenerg$DateTime <- as.POSIXct(paste(subdatenerg$Date, subdatenerg$Time))

#GRAPHIC 3
png(filename = "plot3.png", width = 480, height = 480, units = 'px')

plot(subdatenerg$DateTime, subdatenerg$Sub_metering_1, 
     ylab = "Energy sub metering", xlab = "", type = 'l')
lines(subdatenerg$DateTime, subdatenerg$Sub_metering_2, col = "red")
lines(subdatenerg$DateTime, subdatenerg$Sub_metering_3, col = "blue")
legend('topright', col = c("black", "red", "blue"), legend = 
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1)

# close device
dev.off()