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

## Plot 3
#------------------------------------------------------------

png (filename = "plot3.png",
     height = 480,
     width = 480)

# line plot for Sub_metering_1 (base)
with(workingData,
     plot(dateAndTime,
          Sub_metering_1,
          xlab="",
          ylab="Energy sub metering",
          type="l"))

# add red line for Sub_metering_2
with(workingData,
     lines(dateAndTime,
           Sub_metering_2,
           col="red"))
# add red line for Sub_metering_3
with(workingData,
     lines(dateAndTime,
           Sub_metering_3,
           col="blue"))

# add legend

legend(x= "topright",#position
       legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),# adds labels
       lty=c(1,1,1),#gives the legend appropriate symbols (lines)
       lwd=2.5,
       col=c("black", "red", "blue"))

dev.off()