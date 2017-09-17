## Data wrangling
#----------------------------------
## Load the relevant packages

require(dplyr)
require(lubridate)
library(chron)

## Set local time to english time
myLcTime <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")


## Read-in the data

powerData <- read.table("household_power_consumption.txt", 
                        header = TRUE, 
                        sep = ";",
                        colClasses = c(rep('character', 2), 
                                       rep('numeric',7)),
                        na.strings = '?')

## Inspect the structure of the data
str(powerData)

## convert "Date" and "Time" variables
powerData <- powerData %>%
  mutate(Date = as.Date(Date, "%d/%m/%Y"))

str(powerData)# confirmed.

## Subset the data berween 2007-02-01 and 2007-02-02.

workingData <- powerData %>%
  filter(Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot 2
#---------------------------------------------------------------------------
# Generate a variable compiling date and time for obtaining the day of the week

workingData$dateAndTime <- chron(dates=as.character(workingData$Date), times=workingData$Time, format=c('y-m-d', 'h:m:s'))

# Unfactoring it
workingData$dateAndTime <- as.POSIXct(workingData$dateAndTime)

# saving the file
png (filename = "plot2.png",
     height = 480,
     width = 480)

with(workingData,
     plot(dateAndTime,
          Global_active_power,
          type="l",
          xlab="",
          ylab= "Global active power (kilowatts)"))

dev.off()
