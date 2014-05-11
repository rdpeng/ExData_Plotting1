## Data can be downloaded from this link 
##       https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Assume data is loaded and unzipped
##========================================================================================================================
## plot4.R: Using subplot in R
# Read data, specify the format of each variable, na.strings is coded as ?, date in format dd/mm/yyyy, time in format hh:mm:ss
data<-read.table("household_power_consumption.txt", sep=";", header =T, 
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')
# Extract data for 2 dates: Feb 01,2007 and Feb 02, 2007
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]                 

# Get the date
subdata$datetime<-strptime(paste(subdata$Date,subdata$Time),"%d/%m/%Y %H:%M:%S")

# Open plot4.png
png("plot4.png", height = 480, width = 480)

# multiplot
par(mfrow=c(2,2))
# Global Active Power plot
plot(subdata$datetime,subdata$Global_active_power,xlab ="", ylab = "Global Active Power", type ="l")

# Voltage plot
plot(subdata$datetime,subdata$Voltage,xlab ="datetime", ylab = "Voltage", type ="l")

# Energy sub metering
plot(subdata$datetime,subdata$Sub_metering_1,xlab ="", ylab = "Energy sub metering", type ="l",col = 'black')
lines(subdata$datetime,subdata$Sub_metering_2, col = "red")
lines(subdata$datetime,subdata$Sub_metering_3, col = "blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'), lty = 1, lwd = 3)

# Global Reactive power
plot(subdata$datetime,subdata$Global_reactive_power,xlab ="datetime", ylab = "Global_reactive_power", type ="l")

# Close png file
dev.off()
