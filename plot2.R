library(lubridate)
dataurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile<-"electric_consumption.zip"

##download data
if (!file.exists(zipfile))
    download.file(dataurl, zipfile, mode = "wb")

##unzip data
datapath<-"household_power_consumption.txt"
if (!file.exists(datapath)) 
    unzip(zipfile)
## read data into R
unsortedData<-read.table(datapath, sep = ";", header = TRUE)

##subset data needed for this task
tidyData<-subset(unsortedData, Date == "1/2/2007" | Date == "2/2/2007")
rm(unsortedData)

##convert from character
tidyData$Date<-dmy(tidyData$Date)
tidyData$Global_active_power<-as.numeric(tidyData$Global_active_power)
tidyData$Time<-strptime(paste0(tidyData$Date, tidyData$Time), 
                        "%Y-%m-%d %H:%M:%S", tz = "GMT")
tidyData$Time<-as.POSIXct(tidyData$Time)

## making the line plot, my system language is Russian, so my weekdays in russian too
plot(tidyData$Global_active_power ~ tidyData$Time, type = "l",
     xlab ="", ylab = "Global Active Power (killowatts)")

##copy plot to a png file 
dev.copy(png, file = "plot2.png")
dev.off()