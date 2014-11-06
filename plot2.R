## Load library
library(lubridate)
library(dplyr)

## Read sample file
file <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
file$DateTime <- paste(file$Date,file$Time)
file$DateTime <- strptime(file$DateTime,format="%d/%m/%Y %H:%M:%S")
file$Date <- strptime(file$Date,format="%d/%m/%Y")
## Extract the data of interest
subfile <- file[file$Date >="2007-02-01" & file$Date<="2007-02-02",]
## Convert column 3 to numeric
subfile$Global_active_power <- as.numeric(subfile$Global_active_power)
## Plot x-y
plot(subfile$DateTime,subfile$Global_active_power,type="l",xlab="",ylab="Global Active Power (Kilowatts)",cex.lab=0.8,cex.axis=0.8)
