# exdata-016 sergioquadros 2014-12-04
# R version 3.1.2 (2014-10-31) -- "Pumpkin Helmet"
# Platform: i686-pc-linux-gnu (32-bit)

library(dplyr)
library(lubridate)
library(magrittr)
library(png)

dat2 <-  tbl_df(read.csv("household_power_consumption.txt",sep=";"))
# add new column 'newtime' to data frame 'dat2'
newtime <- dmy_hms(paste(as.character(dat2$Date[]),as.character(dat2$Time[])))
dat2 %<>%mutate(newtime)

# filter by dates: 2007-02-01 and 2007-02-02
dat2$Date <- dmy(dat2$Date)
dat2 %<>% filter(Date==ymd("2007-02-01")|Date==ymd("2007-02-02"))
dat2$Time <-hms(dat2$Time)
class(dat2$Global_active_power) <- "numeric"
yy <- dat2$Global_active_power/500

# adjust local time
local <- Sys.getlocale(category = "LC_TIME")
# local <- "pt_BR.UTF-8" #my local
Sys.setlocale("LC_TIME", "en_US.UTF-8")

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", 
    bg = "white",res=NA)
with(dat2,plot(newtime, yy, xlab="",
               ylab="Global Active Power(kilowatts)",type="l"))
dev.off()

# readjust local time
Sys.setlocale("LC_TIME", local)
