library(dplyr)
# import a chink of data
someData <- read.table("household_power_consumption.txt", sep = ";" , 
                       header = TRUE, skip = 0, nrows = 100000, na.strings = "?")
someData$Date_Time <- as.POSIXct(strptime(paste(someData$Date, someData$Time), 
                                          format = "%d/%m/%Y %H:%M:%S"))
# select the dates between 2007-02-01 and 2007-02-02
cleanData <- filter(someData, 
                    Date_Time >= "2007-02-01 00:00:00" & Date_Time <="2007-02-02 23:59:59")
with(cleanData, plot(x = Date_Time, y = Global_active_power, 
                     type = "l",
                     ylab = "Global Active Power (kilowatts)",
                     xlab = NA))

dev.copy(png, "plot2.png", bg = "transparent")
dev.off()
