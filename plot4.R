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

#setting the global parameters to accomodate four graphs on one page
plot4 <- par(mfrow = c(2, 2), mar = c(4, 4, 2, 2), oma = c(0, 0, 2, 0)) 
with(tabAll, {
        #plotA
        plot(tabAll$DateTime, tabAll$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowats)") 

        #plotB
        plot(tabAll$DateTime, tabAll$Voltage, type = "l", xlab = " ", ylab = "Voltage") 
        
        #plotC
        plot(tabAll$DateTime, tabAll$Sub_metering_1, type = "l", xlab = "datetime", ylab = "Energy sub metering", col = "black")
        lines(tabAll$DateTime, tabAll$Sub_metering_2, col = "red") 
        lines(tabAll$DateTime, tabAll$Sub_metering_3, col = "blue") 
        legend("topright", col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty = 1, box.lwd = 0, pt.cex = 1, cex = 1)
        #plotD
        plot(tabAll$DateTime, tabAll$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power") 
        
})
#saving the plot as a .png file with the required dimensions in pixels
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off() #need this line to finish saving the file as .png
