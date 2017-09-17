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



## Plot 1
#------------------------------------------------------------------------------

# saving the file
png (filename = "plot1.png",
     height = 480,
     width = 480)

hist(workingData$Global_active_power,
     col="red",
     xlab = "Global active power (kilowatts)")

dev.off()
