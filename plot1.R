library(dplyr)


setwd("D:/Data/Academic/Coursera/R/02.-Data Scients with R/04.-Exploratory Data Analysis/W1/10.-Course Project")
db = read.table("household_power_consumption.txt",header = TRUE,sep=";",
                na.strings = "?")

db_fltr<-db%>%
  filter(Date=="2/2/2007"|Date=="1/2/2007")


png(file="plot1.png", width = 480, height = 480)
hist(db_fltr$Global_active_power,col="Red",main = "Global Active Powe"
     ,xlab="Global Active Power (kilowatts)" )
dev.off()