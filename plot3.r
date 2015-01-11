## plot3.r

require(data.table)
# Read in data to data table (not at all efficient). 

file <- "./data/household_power_consumption.txt"
DF <- read.table(file=file, header = TRUE, sep = ";", na.strings="?", colClasses=c("character", "character", rep("numeric",5)))
DF$DateTime <- strptime(paste(DF$Date,DF$Time),format="%d/%m/%Y %H:%M:%S")

# Subset data 
DF2 <- subset(DF, DF$Date %in% c("1/2/2007", "2/2/2007"))

# Create date only filed (unused, but mentioned in the instructions)
DF2$Date2 <- as.Date(DF2$DateTime)


# Plot 3
png(filename="./plot3.png", height=600, width=600, bg="white")

plot(DF2$DateTime, DF2$Sub_metering_1
     , type = 'l'
     , ylab = "Energy Sub Metering"
     , xlab = ""
)
points(DF2$DateTime, DF2$Sub_metering_2
     , type = 'l'
     , col = "red"
)
points(DF2$DateTime, DF2$Sub_metering_3
       , type = 'l'
       , col = "blue"
)
legend("topright", pch="-", col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()