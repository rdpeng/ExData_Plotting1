## Reads the file household_power_consumption.txt
## keeps only apporpriate columns
## plot an exploratory graph of the data read
## saves the graph in the file plot3.png
##  

library(data.table)
library(dplyr)
 

setwd("C:/PC/Coursera/Data_Science/4_ExplDataAna/ExData_Plotting1")

data3<-read.table("household_power_consumption.txt" ,header=T,sep=";",na.strings = "?",stringsAsFactors = FALSE, dec=".") %>%
  filter((Date == "1/2/2007"  | Date== "2/2/2007") & (!is.na(Global_active_power) & !is.na(Date) & !is.na(Time)) ) %>%
  select(Date,Time,Global_active_power,Sub_metering_1,Sub_metering_2,Sub_metering_3) %>%
  mutate(dateTime=paste(Date,Time),n_Sub_metering_1=as.numeric(Sub_metering_1)  ,n_Sub_metering_2=as.numeric(Sub_metering_2)
         ,n_Sub_metering_3=as.numeric(Sub_metering_3))

png(filename="plot3.png", width = 480, height = 480, units = "px", pointsize = 12)
Sys.setlocale("LC_ALL", "English")

with(data3,{
  plot( strptime(dateTime,"%d/%m/%Y %H:%M:%S"),n_Sub_metering_1,type="n",xlab="",
        ylab="Energy sub metering")
  points(strptime(dateTime,"%d/%m/%Y %H:%M:%S"),n_Sub_metering_1,type="l")
  points(strptime(dateTime,"%d/%m/%Y %H:%M:%S"),n_Sub_metering_2,type="l",col="red")
  points(strptime(dateTime,"%d/%m/%Y %H:%M:%S"),n_Sub_metering_3,type="l",col="blue")
  
  legend("topright", 
         legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
         bty = "n",lwd=1, cex=1 ,y.intersp=1.4, col=c("black","red","blue"), lty=c(1,1,1))  
} )
dev.off()


