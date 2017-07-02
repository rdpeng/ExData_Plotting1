# Get set up
setwd("F:/Projects/JHU/Course 4 EDA")
getwd()
# Get Data
D <- read.csv('household_power_consumption.txt',header = TRUE, sep = ";")
D$ADate <- as.Date(D$Date,"%d/%m/%Y")
D$ADate
DSub <- D[which(D$ADate == "2007-02-01" | D$ADate == "2007-02-02"),]
DSub$Global_active_power <- as.numeric(DSub$Global_active_power)
hist(DSub$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()