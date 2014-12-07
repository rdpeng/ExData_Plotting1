
# DATA --Reading and Subsetting
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
## Creating data for only "01 and 02 02/2007" 
powerSubset <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


### Creating Histogram
hist(powerSubset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",  ylab="Frequency", col="Red")
#### Creating PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
