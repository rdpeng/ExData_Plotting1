## Reads the file household_power_consumption.txt
## keeps only apporpriate columns
## plot an exploratory graph of the data read
## saves the graph in the file plot4.png
##  

library(data.table)
library(dplyr)
 
setwd("C:/PC/Coursera/Data_Science/4_ExplDataAna/ExData_Plotting1")


data4<-read.table("household_power_consumption.txt" ,header=T,sep=";",na.strings = "?",stringsAsFactors = FALSE, dec=".") %>%
  filter((Date== "1/2/2007"  | Date== "2/2/2007") & (!is.na(Global_active_power) & !is.na(Date) & !is.na(Time)) & !is.na(Voltage) ) %>%
  mutate(dateTime=paste(Date,Time),num_Global_active_power=as.numeric(Global_active_power),
         n_Sub_metering_1=as.numeric(Sub_metering_1) ,n_Sub_metering_2=as.numeric(Sub_metering_2),
         n_Sub_metering_3=as.numeric(Sub_metering_3), n_Global_reactive_power= as.numeric(Global_reactive_power) ,
         n_Voltage=as.numeric(Voltage) ) %>%
  select(dateTime,num_Global_active_power,n_Sub_metering_1,n_Sub_metering_2,n_Sub_metering_3,n_Global_reactive_power,n_Voltage)


Sys.setlocale("LC_ALL", "English")

png(filename="plot4.png", width = 480, height = 480, units = "px", pointsize = 12)

par(mfrow=c(2,2))
layout(matrix(c(1,2,3,4), 2, 2, byrow = F))
with(data4,{
  
 plot(strptime(dateTime,"%d/%m/%Y %H:%M:%S"),num_Global_active_power,type="l",xlab="", ylab="Global Active Power")

 plot( strptime(data3$dateTime,"%d/%m/%Y %H:%M:%S"),n_Sub_metering_1,type="n",xlab="", ylab="Energy sub metering")
 points(strptime(dateTime,"%d/%m/%Y %H:%M:%S"),n_Sub_metering_1,type="l")
 points(strptime(dateTime,"%d/%m/%Y %H:%M:%S"),n_Sub_metering_2,type="l",col="red")
 points(strptime(dateTime,"%d/%m/%Y %H:%M:%S"),n_Sub_metering_3,type="l",col="blue")

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       bty = "n",lwd=1, cex=1 ,y.intersp=1, col=c("black","red","blue"), lty=c(1,1,1))

 plot(strptime(dateTime,"%d/%m/%Y %H:%M:%S"),n_Voltage ,type="l",xlab="datetime",ylab="voltage")
 plot(strptime(dateTime,"%d/%m/%Y %H:%M:%S"),n_Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

  
})
dev.off()
