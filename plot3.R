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
tidyData$Sub_metering_1<-as.numeric(tidyData$Sub_metering_1)
tidyData$Sub_metering_2<-as.numeric(tidyData$Sub_metering_2)

#firstly create plot then add 2 more graphics of 2nd and 3rd metering
with(tidyData,plot(Sub_metering_1 ~ Time, type = "l",
                   xlab ="", ylab ="Energy sub metering "))
lines(tidyData$Sub_metering_2 ~ tidyData$Time,  col = "red") 
lines(tidyData$Sub_metering_3 ~ tidyData$Time, col ="blue" )

##making the legend 
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1 ,col = c("black", "red", "blue"))

##copy plot to a png file 
dev.copy(png, file = "plot3.png")
dev.off()