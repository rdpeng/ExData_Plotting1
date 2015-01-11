## plot2.r

require(data.table)
# Read in data to data table (not at all efficient). 

file <- "./data/household_power_consumption.txt"
DF <- read.table(file=file, header = TRUE, sep = ";", na.strings="?", colClasses=c("character", "character", rep("numeric",5)))
DF$DateTime <- strptime(paste(DF$Date,DF$Time),format="%d/%m/%Y %H:%M:%S")

# Subset data 
DF2 <- subset(DF, DF$Date %in% c("1/2/2007", "2/2/2007"))

# Create date only filed (unused, but mentioned in the instructions)
DF2$Date2 <- as.Date(DF2$DateTime)


# Plot 2
png(filename="./plot2.png", height=600, width=600, bg="white")

plot(DF2$DateTime, DF2$Global_active_power
     , type = 'l'
     , ylab = "Global Active Power (kilowatts)"
     , xlab = ""
)

dev.off()