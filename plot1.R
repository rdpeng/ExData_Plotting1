dataset<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
str(dataset)
install.packages("lubridate")
library(lubridate)
dataset$Date<-dmy(dataset$Date)
dataset$Time<-hms(dataset$Time)
library(dplyr)
date_filter<-as.Date(c("2007-02-01", "2007-02-02"))
dataset_filter<-filter(dataset, Date %in% date_filter)
with(dataset_filter, hist(Global_active_power,col="red",
                          xlab = "Global Active Power (Kilowatts)", 
                          pin=c(480,480), main= "Global Active Power"))
dev.copy(png,"plot1.png")
dev.off()
