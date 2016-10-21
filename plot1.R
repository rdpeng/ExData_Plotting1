#Load necessary libraries
library(data.table)
library(datasets)

#Get and read data (make sure the zip file is in the working directory!)
unzip(zipfile = "./exdata%2Fdata%2Fhousehold_power_consumption.zip")
data <- fread("household_power_consumption.txt", na.strings = "?")

#convert Date variable into Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset the two days of interest
myData1 <- data[data$Date == "2007-02-01"] 
myData2 <- data[data$Date == "2007-02-02"]        
myData <- rbind(myData1, myData2)       

#plot Global Active Power in a histogram saved as jpg
globalActivePower <- as.numeric(myData$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

