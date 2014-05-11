## plot1.R: Histogram of Global Active Power
## Assume the data is loaded and unzipped.
## Data can be downloaded from 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##==========================================================================================
# Read data, specify the format of each variable, na.strings is coded as ?, date in format dd/mm/yyyy, time in format hh:mm:ss
data<-read.table("household_power_consumption.txt", sep=";", header =T, 
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')
# Extract data for 2 dates: Feb 01,2007 and Feb 02, 2007
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]                 

# Open plot1.png
png("plot1.png", height = 480, width = 480)
hist(subdata$Global_active_power, col ='red', xlab ='Global Active Power (kilowatts)', main = 'Global Active Power')

# Close png file
dev.off()
