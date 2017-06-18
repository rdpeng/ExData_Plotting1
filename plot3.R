library(dplyr)
library(lubridate)

setwd("D:/Data/Academic/Coursera/R/02.-Data Scients with R/04.-Exploratory Data Analysis/W1/10.-Course Project")
db = read.table("household_power_consumption.txt",header = TRUE,sep=";",
                na.strings = "?")


db_fltr<-db%>%
  filter(Date=="2/2/2007"|Date=="1/2/2007")

db_fltr$datetime <- dmy_hms(apply(db_fltr[,1:2], 1, paste, collapse=" "))


png(file="plot3.png")
plot(db_fltr$datetime,db_fltr$Sub_metering_1,type="l",ylab = "Energy sub metering"
     , xlab="")
lines(db_fltr$datetime,db_fltr$Sub_metering_2,col="red")
lines(db_fltr$datetime,db_fltr$Sub_metering_3,col="blue")
legend( x="topright", 
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"), lwd=1 )
dev.off()