setwd("/Users/tina/Desktop/EDA/EDAAssignments")
File <- "/Users/tina/Desktop/EDA/household_power_consumption.txt"
tab5rows <- read.table(File, header = TRUE, sep = ";", dec = ".", na.strings = "?", nrows = 15)
head(tab5rows) 
str(tab5rows[1,])
classes <- sapply(tab5rows, class)
str(classes)
classes[1:2] <- "character"
AllData <- read.table(File, header = TRUE, sep = ";", dec = ".", na.strings = "?", colClasses = classes)
head(AllData)
#converting date and time to datetime classes
Date <- AllData$Date
# str(Date)
Time <- AllData$Time
# str(Time)
DateTime <- strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")
# DateTime
AllData$DateTime <- DateTime
#converting Date column to Date format to subset the data set
AllData$Date <- as.Date(AllData$Date, format = "%d/%m/%Y")
# head(AllData$Date)
FirstDayData <- AllData[AllData$Date == "2007-02-01", ]
SecondDayData <- AllData[AllData$Date == "2007-02-02", ]
tabAll <- rbind(FirstDayData, SecondDayData)
head(tabAll)
tail(tabAll)

#setting the global parameters back to default values
par(mfrow = c(1, 1), mar = c(5.1, 4.1, 4.1, 2.1), oma = c(0, 0, 0, 0))
#plotting the histogram of Global Active Power as a Frequency Plot
plot1 <- hist(tabAll$Global_active_power, breaks = 12, freq = TRUE, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowats)")

#saving the plot as a .png file with the required dimensions in pixels
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off() #need this line to finish saving the file as .png
