#file household_power_consumption.txt should be in current working directory

if(!require('sqldf')){
       install.packages('sqldf')
}
library(sqldf)
cols <- c("character", "character", rep("numeric", 7))
file<-"./household_power_consumption.txt"
sql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
data <- read.csv.sql(file, sql, sep=';', colClasses=cols ,header=T)
dateTime <- paste(data$Date, data$Time, sep=' ')
dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
data$DateTime <- dateTime
rm(cols,dateTime,file,sql)
