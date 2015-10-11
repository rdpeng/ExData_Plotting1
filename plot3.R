setwd("~/R/Explanatory Data Analysis/Assignement01/exdata-data-household_power_consumption")
downloadFileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFileTarget <- "./Data/household_power_consumption.zip"
household_power_consumption <- "./Data/household_power_consumption.txt"
##
if (!file.exists(household_power_consumption)) {
  download.file(downloadFileURL, downloadFileTarget, method = "curl")
  if (!file.exists(downloadFileTarget)) {
    unzip(downloadFileTarget, overwrite = T, exdir = "./Data")
  }
}

## Getting full dataset
data_full <- read.csv(household_power_consumption, header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

## Subsetting the data
data <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

with(data, {
  plot(Sub_metering_1 ~ Datetime, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

