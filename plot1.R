require("sqldf")

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv2.sql(myFile,mySql)
myData$DateTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S") 

plot1 <-hist(myData$Global_active_power , col="red", main = "Global Active Power", labels = F, xlab = ("Global Active Power (kilowatts)"))

png(filename = "plot1.png", width = 480, height = 480, type = "cairo-png", pointsize = 12, bg = "white")
dev.off()
