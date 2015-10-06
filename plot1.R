plot1 <- function() {

# Load File in "mydata"
        
filename <- "household_power_consumption.txt"
mydata <- read.table(filename,header = TRUE,sep =";",na.string="?")

# Create column with date and time

mydata$DateAndTime <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")

# Define initial and end dates and times

Ini_date <- as.POSIXct("2007-02-01 00:00:00")
End_date <- as.POSIXct("2007-02-02 23:59:59")

# Sub-select analysis period

mydata2 <- subset(mydata,DateAndTime >= Ini_date & DateAndTime <= End_date)

# Construct Plot 1 in PNG device

png(filename = "plot1.png", width = 480, height = 480)

hist(mydata2$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()

}