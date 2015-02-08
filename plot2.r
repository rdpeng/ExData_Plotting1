AllData <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

SubData <- subset(AllData, AllData$Date == "1/2/2007" | AllData$Date == "2/2/2007")

dateTime  <- as.POSIXlt(paste(as.Date(SubData$Date, format="%d/%m/%Y"), SubData$Time, sep=" "))

png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",  res = NA)

plot(dateTime, SubData$Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)")

dev.off()
