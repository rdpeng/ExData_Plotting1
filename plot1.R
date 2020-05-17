setwd("C:/Users/aless/Documents/data science/Exploring data/Week 1 - plotting exercise")
# importing data into a file which is in that workding directory
dataset <- read.table("household_power_consumption.txt",header= TRUE, sep = ";")
# converting Dates respectively
dataset$Date <- as.Date(dataset$Date, format= "%d/%m/%Y")
# subseting the data to limit to those with selected dates
data_touse <- subset(dataset, Date >= "2007/02/01" & Date <= "2007/02/02")
png(file="plot1.png", width=480, height=480)
hist(as.numeric(data_touse$Global_active_power), col= "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

