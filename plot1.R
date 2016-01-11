setwd("/Users/macbookpro/Documents/Data Science/Exploratory Data Analysis/Project 1/ExData_Plotting1/figure/")

datos <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")
library(lubridate)
datos_feb <- datos[datos$Date=='1/2/2007'|datos$Date=='2/2/2007',]
datos_feb$DateTime <- dmy(datos_feb$Date)+hms(datos_feb$Time)
datos_feb$DateTime <- as.POSIXlt(datos_feb$DateTime)
## open file device plot1.png
png(filename="plot1.png", width=480,height=480,units="px")

## plots required histogram and annotates it

hist(datos_feb$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## close file device

dev.off()
