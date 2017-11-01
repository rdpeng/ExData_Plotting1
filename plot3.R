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

ggplot(data = hh.power.csmp, aes(x = Date.Time))+
  geom_line(aes(y = Sub_metering_1), color = '#2171b5')+
  geom_line(aes(y = Sub_metering_2), color = '#fc4e2a')+
  geom_line(aes(y = Sub_metering_3), color = '#238443')+
  theme_linedraw()+
  labs(x = '', y = 'Energy Sub-metering')
