#Browse to the working directory
setwd("D:/oNLINE cOURSE")

#Reading data into R
power<- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Obtain the data related to two days(Feb 1 & Feb2):
data<- subset(power, (power$Date == "1/2/2007" | power$Date== "2/2/2007"))

# creating Plot1
png("plot1.png", width=480, height= 480)
hist(data$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
dev.off()
