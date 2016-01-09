library(data.table)
library(dplyr)
library(lubridate)

if (!file.exists("household_power_consumption.txt")) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile = "./exdata-data-household_power_consumption.zip") 
        unzip("./exdata-data-household_power_consumption.zip") }

if (!exists("PowerCons")) {
        PowerCons <- tbl_df(fread(input = "./household_power_consumption.txt", 
                                  showProgress = TRUE,
                                  na.strings = "?")) %>%
                mutate(datetime = dmy_hms(paste(Date,Time))) %>%
                mutate(Date = dmy(Date)) %>% 
                filter(Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))
}

attach(PowerCons)

png(file="plot4.png",width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, Global_active_power, 
     type = "l", 
     main = "",
     xlab = "", 
     ylab = "Global Active Power")

plot(datetime, Voltage, type = "l")

ylimit <- range(c(Sub_metering_1, Sub_metering_2, Sub_metering_3))
plot(datetime,Sub_metering_1, 
     type = "l", main = "", xlab = "", 
     ylim = ylimit, axes = TRUE,
     ylab = "Energy sub metering")

par(new = TRUE)
plot(Sub_metering_2, type = "l", main = "", xlab = "", 
     ylim = ylimit, axes = FALSE, col = "red",
     ylab = "")

par(new = TRUE)
plot(Sub_metering_3, type = "l", main = "", xlab = "", 
     ylim = ylimit, axes = FALSE, col = "blue",
     ylab = "")

par(new = FALSE)
legend(800,40.5,
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), bty = "n",
       lwd=c(1.5,1.5,1.5), col=c("black","blue","red")) 

plot(datetime, Global_reactive_power, type = "l")
par(mfrow=c(1,1))
dev.off()

detach(PowerCons)