## Course: Exploratory Data Analysis
## Course Proyect 1 - Week 1
## PLOT 3
##
## set working directory
setwd("~/Documents/NRS_iMAC/norma_2015/infomedia/data science/4 Exploratory Data Analysis/course proyects")
library(base)
library(sqldf)
##
## loading the data
## file "household_power_consumption.txt" must be in the working directory
file <- "household_power_consumption.txt"
## load only February 1st, 2007 and February 2nd, 2007
data <- read.csv.sql(file, header=TRUE, sep=";", 
                    sql = "select * from file 
                    where Date in ('1/2/2007','2/2/2007') "
                  )
closeAllConnections()
## change column names to lowercase
names(data)
names(data) <- tolower(names(data))
names(data)
## add a new column = date+time
library(lubridate)
library(plyr)
data <- mutate(data, datetime = dmy_hms(paste(data$date, data$time))) 
##
## Making plots
##
## PLOT 3
##
png(file="./plot3.png",width=480,height=480,units="px")
plot(data$datetime,data$sub_metering_1, type="n",
     xlab="", ylab="Energy sub metering", 
     ylim=c(0,38))
lines(data$datetime,data$sub_metering_1,type="l")
lines(data$datetime,data$sub_metering_2,type="l",
      col="red")
lines(data$datetime,data$sub_metering_3,type="l",
      col="blue")
legend("topright", lty=1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2",
                  "Sub_metering_3"))
dev.off()
##
