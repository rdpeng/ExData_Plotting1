setwd("/Users/tina/Desktop/EDA/EDAAssignments")
File <- "/Users/tina/Desktop/EDA/household_power_consumption.txt"
tab5rows <- read.table(File, header = TRUE, sep = ";", dec = ".", na.strings = "?", nrows = 15)
classes <- sapply(tab5rows, class)
classes[1:2] <- "character"
AllData <- read.table(File, header = TRUE, sep = ";", dec = ".", na.strings = "?", colClasses = classes)
#converting date and time to datetime classes
Date <- AllData$Date
Time <- AllData$Time
AllData$DateTime <- strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")
#converting Date column to Date format to subset the data set
AllData$Date <- as.Date(AllData$Date, format = "%d/%m/%Y")
# head(AllData$Date)
FirstDayData <- AllData[AllData$Date == "2007-02-01", ]
SecondDayData <- AllData[AllData$Date == "2007-02-02", ]
tabAll <- rbind(FirstDayData, SecondDayData)

#plotting the Global Active Power as a function of the day of the week
WeekDay <- weekdays(tabAll$DateTime, abbreviate = TRUE)

#setting the global parameters back to default values
par(mfrow = c(1, 1), mar = c(5.1, 4.1, 4.1, 2.1), oma = c(0, 0, 0, 0))
plot3 <- plot(tabAll$DateTime, tabAll$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(tabAll$DateTime, tabAll$Sub_metering_2, col = "red") 
lines(tabAll$DateTime, tabAll$Sub_metering_3, col = "blue") 
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, box.lwd = 0, pt.cex = 1, cex = 1)

#saving the plot as a .png file with the required dimensions in pixels
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off() #need this line to finish saving the file as .png
