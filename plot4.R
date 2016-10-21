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
datetime <- as.POSIXct(datetime)

#define and set required data as numeric
globalActivePower <- as.numeric(myData$Global_active_power)
submetering_1 <- as.numeric(myData$Sub_metering_1)
submetering_2 <- as.numeric(myData$Sub_metering_2)
submetering_3 <- as.numeric(myData$Sub_metering_3)
voltage <- as.numeric(myData$Voltage)
Global_reactive_power <- as.numeric(myData$Global_reactive_power)

#set layout and initiate jpg 
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

#first graph
plot(globalActivePower ~ datetime, 
     type = "l", 
     col = "black",
     ylab = "Global Active Power", 
     xlab = "")

#second graph
plot(submetering_1 ~ datetime, 
     type = "l", 
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")
lines(submetering_2 ~ datetime,
      col = "red")
lines(submetering_3 ~ datetime,
      col = "blue")
legend("topright", 
       lty = c(1, 1, 1), 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n") 

#third graph
plot(voltage ~ datetime, 
     type = "l", 
     col = "black",
     ylab = "Voltage", 
     xlab = "datetime",
     ylim = c(234, 246))

#fourth graph
plot(Global_reactive_power ~ datetime, 
     type = "l", 
     col = "black",
     ylab = "Global_reactive_power", 
     xlab = "datetime")

dev.off()
