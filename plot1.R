library(dplyr)
library(data.table)
library(ggplot2)
require(scales)
library(gridExtra)
 
hh.power.csmp <- read.csv('../pete/Downloads/household_power_consumption.txt'
                                 , sep = ';'
                                ,na.strings = '?')
hh.power.csmp$Date.Time <- paste(hh.power.csmp$Date, hh.power.csmp$Time)
hh.power.csmp$Date.Time <- strptime(hh.power.csmp$Date.Time, format = '%d/%m/%Y %H:%M:%S')
hh.power.csmp <- hh.power.csmp[which((hh.power.csmp$Date.Time >= '2007-02-14 00:00:00') 
                                     & (hh.power.csmp$Date.Time <= '2007-02-15 23:59:59')),]

ggplot(data = hh.power.csmp, aes(x = Global_active_power))+
  geom_histogram(bins = 10, fill = 'orange', color = 'black', alpha = 0.75)+
  labs(x = 'Global Active Power (kilowatts)'
       , y = 'Frequency'
       , title = expression(bold('Global Active Power')))+
  theme_linedraw()
