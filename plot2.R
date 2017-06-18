library(dplyr)
library(lubridate)

setwd("D:/Data/Academic/Coursera/R/02.-Data Scients with R/04.-Exploratory Data Analysis/W1/10.-Course Project")
db = read.table("household_power_consumption.txt",header = TRUE,sep=";",
                na.strings = "?")


db_fltr<-db%>%
  filter(Date=="2/2/2007"|Date=="1/2/2007")

db_fltr$datetime <- dmy_hms(apply(db_fltr[,1:2], 1, paste, collapse=" "))


png(file="plot2.png", width = 480, height = 480)
plot(db_fltr$datetime,db_fltr$Global_active_power,type="l",
     xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()