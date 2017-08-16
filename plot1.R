library(dplyr)
# import a chink of data
someData <- read.table("household_power_consumption.txt", sep = ";" , 
                       header = TRUE, skip = 0, nrows = 100000, na.strings = "?")
someData$Date_Time <- as.POSIXct(strptime(paste(someData$Date, someData$Time), 
                                          format = "%d/%m/%Y %H:%M:%S"))
# select the dates between 2007-02-01 and 2007-02-02
cleanData <- filter(someData, 
                    Date_Time >= "2007-02-01 00:00:00" & Date_Time <="2007-02-02 23:59:59")
hist(cleanData$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red",
     main = "Global Active Power")
dev.copy(png, "plot1.png", bg = "transparent")
dev.off()
