setwd("C:/AA Bestanden/MOOC Data Science - Johns Hopkins")

## Reading datafile
FileName 	<- "household_power_consumption.txt"
Data 		<- read.csv(FileName, header = TRUE, sep=";", na.strings="?", dec=".", stringsAsFactors = FALSE, comment.char="", quote ='\"')
# summary(Data)
# colnames(Data)
# head(Data)
# tail(Data)

## Subsetting data - limit to first two days of february 2007
SubSetData 	<- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]
# dim(SubSetData)
rm(Data)

## Create Date as Date-object
SubSetData$Date <- as.Date(SubSetData$Date, format="%d/%m/%Y %H:%M:%S")

## Converting dates and corresponding times to DateTime
timestamp <- paste(SubSetData$Date, SubSetData$Time)
SubSetData$Datetime <- as.POSIXct(timestamp)

## Make Plot4 - screen
windows()
par(mfcol = c(2,2))

plot(SubSetData$Datetime, SubSetData$Global_active_power, type = "l", bg = "white", xlab = "", ylab = "Global Active Power")

plot(SubSetData$Datetime, SubSetData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(SubSetData$Datetime, SubSetData$Sub_metering_2, type="l", col="red")
lines(SubSetData$Datetime, SubSetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"), bty="n")


#plot(SubSetData$Datetime, SubSetData$Voltage, type = "l", bg = "white", xlab = "Datetime")
with(SubSetData, plot(Datetime, Voltage, type="l"))

with(SubSetData, plot(Datetime, Global_reactive_power, type="l"))


## Make Plot4 - png
png("Plot4.png", width = 480, height=480)
par(mfcol = c(2,2))

plot(SubSetData$Datetime, SubSetData$Global_active_power, type = "l", bg = "white", xlab = "", ylab = "Global Active Power")

plot(SubSetData$Datetime, SubSetData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(SubSetData$Datetime, SubSetData$Sub_metering_2, type="l", col="red")
lines(SubSetData$Datetime, SubSetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"), bty="n")


#plot(SubSetData$Datetime, SubSetData$Voltage, type = "l", bg = "white", xlab = "Datetime")
with(SubSetData, plot(Datetime, Voltage, type="l"))

with(SubSetData, plot(Datetime, Global_reactive_power, type="l"))

dev.off()

