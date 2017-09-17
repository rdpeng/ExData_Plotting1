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

# Generate a variable compiling date and time for obtaining the day of the week

workingData$dateAndTime <- chron(dates=as.character(workingData$Date), times=workingData$Time, format=c('y-m-d', 'h:m:s'))

# Unfactoring it
workingData$dateAndTime <- as.POSIXct(workingData$dateAndTime)

### Plot 4
#------------------------------------------------------------

png (filename = "plot4.png",
     height = 480,
     width = 480)

par(mfrow = c(2,2),
    mar = c(5, 2, 2, 2),
    oma = c(0,4,0,4)) # par function for 2 rows of plots and 2 rows of collumns

with (workingData, {
  #plot 1
  plot(dateAndTime,
       Global_active_power,
       type="l",
       xlab="",
       ylab= "Global active power (kilowatts)")
  
  # plot 2
  
  plot(dateAndTime,
       Voltage,
       type="l",
       xlab="datetime",
       ylab="Voltage")
  
  # plot 3
  
  plot(dateAndTime,
       Sub_metering_1,
       xlab="",
       ylab="Energy sub metering",
       type="l")
  
  # add red line for Sub_metering_2
  lines(dateAndTime,
        Sub_metering_2,
        col="red")
  # add red line for Sub_metering_3
  lines(dateAndTime,
        Sub_metering_3,
        col="blue")
  
  # add legend
  
  legend(x= "topright",#position
         legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),# adds labels
         lty=c(1,1,1),#gives the legend appropriate symbols (lines)
         lwd=2.5,
         col=c("black", "red", "blue"))
  
  #Plot 4
  
  plot(dateAndTime,
       Global_reactive_power,
       type="l",
       xlab="datetime")
})


dev.off()
