library(dplyr)
if(!file.exists("exdata-data-household_power_consumption.zip"))
{
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      destfile = "exdata-data-household_power_consumption.zip",
                      method = "curl")    
}
rawHouseHoldData <- read.table(unz("exdata-data-household_power_consumption.zip"
                                   ,"household_power_consumption.txt")
                               ,header = TRUE,sep=";",na.strings ="?")
#removing na's if any
houseHoldData <- rawHouseHoldData[!is.na(rawHouseHoldData$Date),]
#converting factor variable Date to Date
houseHoldData$Date<-as.Date(houseHoldData$Date,format="%d/%m/%Y")
dfDplyr<-tbl_df(houseHoldData)
interestedDates<-c(as.Date("2007-02-01"),as.Date("2007-02-02"))
#filtering data for above two dates
interestedDatesData <- filter(dfDplyr,Date %in% interestedDates)
interestedDatesData$Global_active_power<-
        as.numeric(interestedDatesData$Global_active_power)
png("plot2.png",width = 480,height = 480)
interestedDatesData$DateTime <-strptime(paste(interestedDatesData$Date,
                                              interestedDatesData$Time),
                                        format="%Y-%m-%d %H:%M:%S")
plot(interestedDatesData$DateTime,interestedDatesData$Global_active_power,
     type = "l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()