# exdata-016 sergioquadros 2014-12-04
# R version 3.1.2 (2014-10-31) -- "Pumpkin Helmet"
# Platform: i686-pc-linux-gnu (32-bit)

library(dplyr)
library(lubridate)
library(magrittr)
library(png)

dat2<-tbl_df(read.csv("household_power_consumption.txt",sep=";", header=TRUE, as.is=TRUE))
# add new column 'newtime' to data frame 'dat2'
newtime<-dmy_hms(paste(as.character(dat2$Date[]),as.character(dat2$Time[])))
dat2 %<>%mutate(newtime)

# filter by dates: 2007-02-01 and 2007-02-02
dat2$Date <- dmy(dat2$Date)
dat2 %<>% filter(Date==ymd("2007-02-01")|Date==ymd("2007-02-02"))

# factors->numeric
dat2$Global_active_power %<>% as.numeric
dat2$Voltage %<>% as.numeric
dat2$Global_reactive_power %<>% as.numeric
dat2$Sub_metering_1 %<>% as.numeric
dat2$Sub_metering_2 %<>% as.numeric
dat2$Sub_metering_3 %<>% as.numeric

# adjust local time
local <- Sys.getlocale(category = "LC_TIME")
# local <- "pt_BR.UTF-8" #my local
Sys.setlocale("LC_TIME", "en_US.UTF-8")

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", 
    bg = "white",res=NA)
par(mfrow=c(2,2))
##############################   LEFT-TOP       ################################
with(dat2,plot(newtime, Global_active_power, xlab="",
               ylab="Global Active Power",type="l"))
##############################   RIGHT-TOP      ################################
with(dat2,plot(newtime, Voltage, xlab="datetime",
               ylab="Voltage",type="l"))
##############################   LEFT-BOTTOM    ################################
with(dat2,{
        plot(newtime, Sub_metering_1, xlab="",
             ylab="Energy sub metering",type="l")
        lines(newtime, Sub_metering_2, xlab="",
              ylab="Energy sub metering",type="l",col="red")
        lines(newtime, Sub_metering_3, xlab="",
              ylab="Energy sub metering",type="l",col="blue")
        
})
legenda=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", bty="n", lty=1, lwd=1, col = c("black", "blue", "red"),
       legend =legenda,cex=0.75)
##############################   RIGHT-BOTTOM   ################################
with(dat2,plot(newtime,Global_reactive_power, xlab="datetime",
               ylab="Global_reactive_power",type="l"))
dev.off()

# readjust local time
Sys.setlocale("LC_TIME", local)
