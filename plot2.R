library(dplyr)
library(data.table)
library(ggplot2)
require(scales)
library(gridExtra)
 
hh.power.csmp <- read.csv('../pete/Downloads/household_power_consumption.txt'
                          , sep = ';'
                          ,na.strings = '?')
hh.power.csmp$Date <- as.Date(as.character(hh.power.csmp$Date), '%d/%m/%Y')
hh.power.csmp <- subset(hh.power.csmp, hh.power.csmp$Date %between% c('2007-02-01','2007-02-02'))
hh.power.csmp$Datetime <- strptime(paste(hh.power.csmp$Date
                                         , as.character(hh.power.csmp$Time))
                                   ,format = '%Y-%m-%d %H:%M:%S')

plot(y = hh.power.csmp$Global_active_power, x = hh.power.csmp$Datetime
     , 'l', xlab = 'Datetime', ylab = 'Global Active Power')

