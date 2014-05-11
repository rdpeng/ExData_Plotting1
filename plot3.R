## Data can be downloaded from this link 
##       https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Assume data is loaded and unzipped
##========================================================================================================================
## plot3.R: Energy sub metering Power in two days Feb 01, 2007 and Feb 02, 2007
## Sub_metering_1: in black
## Sub_metering_2: in red
## Sub_metering_3: in blue
# Read data, specify the format of each variable, na.strings is coded as ?, date in format dd/mm/yyyy, time in format hh:mm:ss
data<-read.table("household_power_consumption.txt", sep=";", header =T, 
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')
# Extract data for 2 dates: Feb 01,2007 and Feb 02, 2007
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]                 

# Get the date
subdata$datetime<-strptime(paste(subdata$Date,subdata$Time),"%d/%m/%Y %H:%M:%S")

# Open  plot3.png
png("plot3.png", height = 480, width = 480)
plot(subdata$datetime,subdata$Sub_metering_1,xlab ="", ylab = "Energy sub metering", type ="l",col = 'black')
lines(subdata$datetime,subdata$Sub_metering_2, col = "red")
lines(subdata$datetime,subdata$Sub_metering_3, col = "blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'), lty = 1, lwd = 3)

# Close png file
dev.off()
