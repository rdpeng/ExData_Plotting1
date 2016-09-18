house.info <- read.table("household_power_consumption.txt",header=T,sep=';')
library(lubridate)
house.info$Date <- dmy(house.info$Date)
house.info$Time <- hms(house.info$Time)

target.house <- house.info[house.info$Date >= ymd("2007-02-01") & house.info$Date < ymd("2007-02-03"),]

for(idx in 3:ncol(target.house)) target.house[,idx] <- as.numeric(as.character(target.house[,idx]))
