#Loading information and generating data set filtered by date
datoenergy <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', 
                         colClasses = c("character", "character", rep("numeric",7)), 
                         na = "?")

datoenergy$Date <- as.Date(datoenergy$Date, "%d/%m/%Y")
subdatenerg <- subset(datoenergy, Date == "2007-02-01" | Date == "2007-02-02")

#Create the DateTime variable for the x-axis (union Date&Time)
subdatenerg$DateTime <- as.POSIXct(paste(subdatenerg$Date, subdatenerg$Time))

#GRAPHIC 2
png(filename = "plot2.png", width = 480, height = 480, units = 'px')
plot(subdatenerg$DateTime, subdatenerg$Global_active_power, 
     ylab = "Global Active Power (Kilowatts)", xlab = "", type = 'l')

# close device
dev.off()