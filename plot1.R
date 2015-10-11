# Plot 1 Script
getwd()
library(graphics)
library(dplyr)
if(!file.exists("4Cdir")){dir.create("4Cdir")}
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,dest="./4Cdir/4Cp1data.zip")
unzip("./4Cdir/4Cp1data.zip",exdir="./4Cdir")
## Checking the name of the file with the necessary data
list.files("./4Cdir")
## Reading in the data from household_power_consumption.txt names<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
read1<-read.table("./4Cdir/household_power_consumption.txt",sep=";",col.names=names,na.strings = "?",header=TRUE)
read2<-read1[read1$Date=="1/2/2007"|read1$Date=="2/2/2007",]    
read3 <- mutate(read2, Date_Time = paste(Date, Time, sep = " "))
read3$Date_Time <- strptime(read3$Date_Time, "%d/%m/%Y %H:%M:%S")
## Note: Did not make use of as.Date() for the plotting exercise
# Creating the histogram and saving the graph as plot1.png
read3[, 3:9] <- lapply(read3[, 3:9], as.numeric)
par(mfrow = c(1,1))
hist(read3$Global_active_power, col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
