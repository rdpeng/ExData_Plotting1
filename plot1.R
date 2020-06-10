#Loading appropriate packages
library(lubridate)
library(dplyr)

#Loading raw data
origFile=unzip("./data/exdata_data_household_power_consumption.zip")
myDataSet <- read.table(origFile, sep=";", na.strings = "?", header = TRUE)
myDataSet$Date <- dmy(myDataSet$Date)
myDataSet$Time <- hms(myDataSet$Time)
myDataSet[, 3:9] <- lapply(myDataSet[, 3:9], as.numeric)

#Subsetting to 2007-02-01:02
myDataSet <- filter(myDataSet, Date == ymd("2007/02/01") | Date == ymd("2007/02/02"))

#Creating histogram
png("plot1.png", width = 480, height = 480)
hist(myDataSet$Global_active_power, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()