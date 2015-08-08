setwd("C:/Users/jobby/Documents/GitHub/ExData_Plotting1")

powerData<- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings = "?")

powerData$Date<- as.Date(powerData$Date, format = "%d/%m/%Y")

newDat<- subset(powerData, subset = (Date == "2007-02-01" | Date == "2007-02-02"))
 
DateTime<- paste(as.Date(newDat$Date), newDat$Time)

newDat$DateTime <- as.POSIXct(DateTime)

hist(newDat$Global_active_power, xlab="Global Active Power", ylab="Frequency", col = "Red")

dev.copy(png, file = "plot1.png", height = 480, width = 480)

dev.off()