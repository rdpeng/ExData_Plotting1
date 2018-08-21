## Reads the file household_power_consumption.txt
## keeps only apporpriate columns
## plot an exploratory graph of the data read
## saves the graph in the file plot2.png
##  

library(data.table)
library(dplyr)
 
setwd("C:/PC/Coursera/Data_Science/4_ExplDataAna/ExData_Plotting1")

data2<-read.table("household_power_consumption.txt" ,header=T,sep=";",na.strings = "?",stringsAsFactors = FALSE, dec=".") %>%
  filter((Date == "1/2/2007"  | Date== "2/2/2007") & (!is.na(Global_active_power) & !is.na(Date) & !is.na(Time)) ) %>%
  select(Date,Time,Global_active_power) %>%
  mutate(dateTime=paste(Date,Time),num_Global_active_power=as.numeric(Global_active_power))

png(filename="plot2.png", width = 480, height = 480, units = "px", pointsize = 12)
Sys.setlocale("LC_ALL", "English")
with(data2,
     plot(strptime(dateTime,"%d/%m/%Y %H:%M:%S"),num_Global_active_power,type="l",
          xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
