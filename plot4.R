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

plot1 <- ggplot(data = hh.power.csmp, aes(y = Global_active_power, x = Date.Time))+
  geom_line(color = '#6287a2')+
  labs(y = 'Global Active Power', x = '')+
  theme_linedraw()

plot2 <- ggplot(data = hh.power.csmp, aes(y = Voltage, x = Date.Time))+
  geom_line(color = '#5ec0ca')+
  labs(y = 'Voltage', x = '')+
  theme_linedraw()

plot3 <- ggplot(data = hh.power.csmp, aes(x = Date.Time))+
  geom_line(aes(y = Sub_metering_1), color = '#2171b5')+
  geom_line(aes(y = Sub_metering_2), color = '#fc4e2a')+
  geom_line(aes(y = Sub_metering_3), color = '#238443')+
  theme_linedraw()+
  labs(x = '', y = 'Energy Sub-metering')

plot4 <- ggplot(data = hh.power.csmp, aes(y = Global_reactive_power, x = Date.Time))+
  geom_line(color = '#006837')+
  labs(y = 'Global Reactive Power', x = '')+
  theme_linedraw()

grid.arrange(plot1,plot2,plot3,plot4, nrow = 2, ncol = 2)




