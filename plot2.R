## 
##
## plot2.R: Global Active Power in two days Feb 01, 2007 and Feb 02, 2007
# Read data, specify the format of each variable, na.strings is coded as ?, date in format dd/mm/yyyy, time in format hh:mm:ss
data<-read.table("household_power_consumption.txt", sep=";", header =T, 
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')
# Extract data for 2 dates: Feb 01,2007 and Feb 02, 2007
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]                 

# Get the date
subdata$datetime<-strptime(paste(subdata$Date,subdata$Time),"%d/%m/%Y %H:%M:%S")

# Open plot2.png
png("plot2.png", height = 480, width = 480)
plot(subdata$datetime,subdata$Global_active_power,xlab ="", ylab = "Global Active Power (kilowatts)", type ="l")
# Close png file
dev.off()
