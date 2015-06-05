## Course: Exploratory Data Analysis
## Course Proyect 1 - Week 1
## PLOT 2
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
## PLOT 2
##
png(file="./plot2.png",width=480,height=480,units="px")
plot(data$datetime,data$global_active_power,
     xlab = "", 
     ylab = "Global Active Power (kilowatts)",
     type="l")
dev.off()
