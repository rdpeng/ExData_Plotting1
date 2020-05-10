getwd()
setwd("F:/Data Science/Johns Hopkins University(Coursera)/4 . Exploratory Data Analysis/Project")

data <- read.table("household_power_consumption.txt"
                   , header = TRUE
                   , sep = ";")
head(data)

library(lubridate)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
head(data)

newData <- subset(data , Date >= "2007-2-1" & Date <= "2007-2-2")
head(newData)
tail(newData)

newData$date.time <- paste(newData$Date , newData$Time)
head(newData)

newData$date.time <- as.POSIXct(newData$date.time)
head(newData)

plot(x = newData$date.time 
     , y = newData$Sub_metering_1
     , type = "l"
     , ylab = "Global Active Power (kilowatts)"
     , xlab = ""
     , col = "black")
lines(x = newData$date.time 
      , y = newData$Sub_metering_2
      , col = "red")
lines(x = newData$date.time 
      , y = newData$Sub_metering_3
      , col = "blue")
legend("topright"
       , col = c("black", "red", "blue")
       , lwd = c(1,1,1)
       , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
       

dev.copy(png
         , file = "plot3.png"
         , width = 480
         , height = 480)
dev.off()
