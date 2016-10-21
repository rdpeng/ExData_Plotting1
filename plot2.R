#Load necessary libraries
library(data.table)
library(datasets)

#Get and read data (make sure the zip file is in the working directory!)
unzip(zipfile = "./exdata%2Fdata%2Fhousehold_power_consumption.zip")
data <- fread("household_power_consumption.txt", na.strings = "?", 
              stringsAsFactors = FALSE, dec = ".")

#convert Date variable into Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset the two days of interest
myData1 <- data[data$Date == "2007-02-01"] 
myData2 <- data[data$Date == "2007-02-02"]        
myData <- rbind(myData1, myData2)     

#convert and combine date and time variables
datetime <- strptime(paste(myData$Date, myData$Time), 
                            "%Y-%m-%d %H:%M:%S")

#plot Global Active Power across the two days and save as jpg
globalActivePower <- as.numeric(myData$Global_active_power)
datetime <- as.POSIXct(datetime)
png("plot2.png", width = 480, height = 480)
plot(globalActivePower ~ datetime, 
     type = "l", 
     col = "black",
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")
dev.off()
