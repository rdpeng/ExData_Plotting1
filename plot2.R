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

png(file="plot2.png",width=480, height=480)
plot(datetime,Global_active_power, 
     type = "l", 
     main = "", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()

detach(PowerCons)