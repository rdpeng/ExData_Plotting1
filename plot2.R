setwd("/Users/macbookpro/Documents/Data Science/Exploratory Data Analysis/Project 1/ExData_Plotting1/figure/")

datos <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")
library(lubridate)
datos_feb <- datos[datos$Date=='1/2/2007'|datos$Date=='2/2/2007',]
datos_feb$DateTime <- dmy(datos_feb$Date)+hms(datos_feb$Time)
datos_feb$DateTime <- as.POSIXlt(datos_feb$DateTime)
## open file device plot2.png
png(filename="plot2.png", width=480,height=480,units="px")

## plots required graph and annotates it

plot(datos_feb$DateTime,datos_feb$Global_active_power, main="Global Active Power",xlab="", ylab="Global Active Power (kilowatts)", type="l")

## close file device

dev.off()
