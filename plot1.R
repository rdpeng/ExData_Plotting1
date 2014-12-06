# exdata-016 sergioquadros 2014-12-04
# R version 3.1.2 (2014-10-31) -- "Pumpkin Helmet"
# Platform: i686-pc-linux-gnu (32-bit)
library(dplyr)
library(lubridate)
library(magrittr)
library(png)

dat2 <-  tbl_df(read.csv("household_power_consumption.txt",sep=";", header=TRUE, as.is=TRUE))
dat2$Date <- dmy(dat2$Date)
dat2 %<>% filter(Date==ymd("2007-02-01")|Date==ymd("2007-02-02"))
dat2$Time <-hms(dat2$Time)
dat2$Global_active_power %<>% as.numeric

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", 
                        bg = "white",res=NA)
hist(dat2$Global_active_power,col = "red",main ="Global Active Power", 
          xlab="Global Active Power(kilowatts)", ylab="Frequency")
dev.off()
