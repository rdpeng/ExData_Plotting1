# Manually download to getwd()\\Data
# Unzip file to Data\\household_power_consumtion.txt
unzip("Data\\exdata_data_household_power_consumption.zip", exdir = "Data")

rawData <- read.table("Data\\household_power_consumption.txt",
    header = TRUE,
    sep = ";",
    na.strings = "?",
    stringsAsFactors = FALSE
    )

str(rawData)

# Add computed data time column use Pacific timezone since this is UC Irvine data 
rawData <- cbind(rawData,
      DateTime = strptime(paste(rawData$Date, rawData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S", tz = "US/Pacific"))

library(lubridate)

# Examine only the subset from 2007-02-01 to 2007-02-02
theData<-subset(rawData,DateTime >=ymd("2007-02-01",tz="US/Pacific") & DateTime < ymd("2007-02-03",tz="US/Pacific"))
dim(theData)
head(theData$DateTime)
tail(theData$DateTime)

# Plot hist PNG
png(filename="Data\\plot1.png")
hist(theData$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()