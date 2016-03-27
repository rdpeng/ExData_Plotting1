setwd("C:/AA Bestanden/MOOC Data Science - Johns Hopkins")

## Reading datafile
FileName 	<- "household_power_consumption.txt"
Data 		<- read.csv(FileName, header = TRUE, sep=";", na.strings="?", dec=".", stringsAsFactors = FALSE, comment.char="", quote ='\"')
# summary(Data)
# tail(Data)

## Subsetting data - limit to first two days of february 2007
SubSetData 	<- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]
# dim(SubSetData)
rm(Data)

## Create Date as Date-object
SubSetData$Date <- as.Date(SubSetData$Date, format="%d/%m/%Y")

## Converting dates and corresponding times to DateTime
timestamp <- paste(SubSetData$Date, SubSetData$Time)
SubSetData$Datetime <- as.POSIXct(timestamp)

## Make Histogram
windows()
hist(SubSetData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="Red")
# dev.off()

## Saving screenplot to file
# dev.copy(png, file="plot1.png", height=480, width=480)
# dev.off()
## there's some trouble in the layout of the copy; so better make png directly.

## Make Histogram
png("Plot1.png", width = 480, height=480)
hist(SubSetData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="Red")
dev.off()

