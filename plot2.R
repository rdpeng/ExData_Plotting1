dataset<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
str(dataset)
library(dplyr)
library(tidyr)
date_filter<-c("1/2/2007", "2/2/2007")
dataset_filter<-filter(dataset, Date %in% date_filter)
data_united<-unite(dataset_filter,col = "date_time", Date:Time,sep = "-")
data_united$date_time<-gsub("(/|:)","-",data_united$date_time)
library(lubridate)
Sys.setlocale("LC_TIME", "English")
data_united$date_time<-dmy_hms(data_united$date_time)

with(data_united,plot(date_time, Global_active_power, type="l",ylab = "Global Active Power (Kilowatts)", 
                      pin=c(480,480),xlab = ""))
dev.copy(png,"plot2.png")
dev.off()

