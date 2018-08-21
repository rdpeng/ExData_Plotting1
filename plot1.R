## Reads the file household_power_consumption.txt
## keeps only apporpriate columns
## plot an exploratory graph of the data read
## saves the graph in the file plot1.png
##  

library(data.table)
library(dplyr)
 

setwd("C:/PC/Coursera/Data_Science/4_ExplDataAna/ExData_Plotting1")

data1<-read.table("household_power_consumption.txt" ,header=T,sep=";",na.strings = "?",stringsAsFactors = FALSE, dec=".") %>%
  filter(Date== "1/2/2007"  | Date== "2/2/2007" ) %>%
  select(Global_active_power,Date)

png(filename="plot1.png", width = 480, height = 480, units = "px", pointsize = 12)
 hist(as.numeric(data1$Global_active_power),col="red",main="Global Active Power ",
     xlab="Global Active Power (kilowatts)",ylab= "Frequency", breaks=12,ylim=c(0,1200))
dev.off()