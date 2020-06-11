#Loading appropriate packages
library(lubridate)
library(dplyr)

#Loading raw data
#Since Plot1 would generate the unpackaged TXT file, I won't unpack it again
#However it doesn't appear in the repo, because it's size is bigger than the upload limit
myDataSet <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
myDataSet[, 3:9] <- lapply(myDataSet[, 3:9], as.numeric)
myDataSet$DateTime <- dmy_hms(paste(myDataSet$Date,myDataSet$Time))

#Subsetting to 2007-02-01:02
myDataSet <- filter(myDataSet, DateTime >= ymd_hms("2007/02/01 00:00:00") & DateTime < ymd_hms("2007/02/03 00:00:00"))

#Making the plot - note that my environment is Hungarian, so the weekday names are also in HU
png("plot2.png", width = 480, height = 480)
plot(myDataSet$DateTime, myDataSet$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()