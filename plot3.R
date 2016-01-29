dataFile <- "~/JHU Data Science/ExData_Plotting1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot3.png", height = 480, width = 480)

timestamp <- strptime (paste(subSetData$Date, subSetData$Time), 
                       format="%d/%m/%Y %H:%M:%S", tz="UTC")
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

plot(timestamp,subMetering1, 
     type="l", xlab="", ylab="Energy sub metering", col = "black")
lines(timestamp,subMetering2, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)", col = "red")
lines(timestamp,subMetering3, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)", col = "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = 1, lwd = 1, col = c("black","red","blue"))
dev.off()
