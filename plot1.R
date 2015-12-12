##MAKING PLOT 1 FOR PROJECT 1 IN EXPLORATORY DATA ANALYSIS
#Set WD
setwd("~/DATASCIENCE/EDA")
#Read data
data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# Converts dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saves to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()