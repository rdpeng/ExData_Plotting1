getwd()
setwd("F:/Data Science/Johns Hopkins University(Coursera)/4 . Exploratory Data Analysis/Project")

data <- read.table("household_power_consumption.txt"
                   , header = TRUE
                   , sep = ";")
head(data)

library(dplyr)
library(lubridate)

date1 <- filter(data , Date == "1/2/2007") 
head(date1)

date2 <- filter(data , Date == "2/2/2007")
head(date2)

newData <- rbind(date1 , date2)
head(newData)
tail(newData)

hist(as.numeric(newData$Global_active_power)
     , col = "red"
     , main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)")

dev.copy(png 
         , file = "plot1.png" 
         , width = 480 
         , height = 480)
dev.off()
