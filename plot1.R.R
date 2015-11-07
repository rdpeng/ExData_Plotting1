##plot1
## chose Directory
dir <- choose.dir()
setwd(dir)
## Load Data
power <- read.csv("household_power_consumption.txt", sep=";", quote="\"", header = T, stringsAsFactors = F)
start <- "02/01/2007"
end <- "02/02/2007"
## Date Conversion
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
## Sort
date <- "2007-02-01:2007-02-02"
pwr <- subset(power, subset=(Date == date))
pwr$Global_active_power <- as.numeric(pwr$Global_active_power)
##Plot
hist(pwr$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()