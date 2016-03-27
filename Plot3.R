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
SubSetData$Date <- as.Date(SubSetData$Date, format="%d/%m/%Y %H:%M:%S")

## Converting dates and corresponding times to DateTime
timestamp <- paste(SubSetData$Date, SubSetData$Time)
SubSetData$Datetime <- as.POSIXct(timestamp)

## Make Plot3 - screen
windows()
plot(SubSetData$Datetime, SubSetData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(SubSetData$Datetime, SubSetData$Sub_metering_2, type="l", col="red")
lines(SubSetData$Datetime, SubSetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Make Plot3 - png
png("Plot3.png", width = 480, height=480)
plot(SubSetData$Datetime, SubSetData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(SubSetData$Datetime, SubSetData$Sub_metering_2, type="l", col="red")
lines(SubSetData$Datetime, SubSetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()


#windows()
#dev.hold(1)
#with(SubSetData, plot(Datetime, Sub_metering_1, type="n", bg = "white", xlab = "", ylab = "Energy sub metering", main="Plot 3", sub="three plots in one graph including Legenda"))
#with(SubSetData, plot(Datetime, Sub_metering_1, type="l", col = "black"))
#with(SubSetData, plot(Datetime, Sub_metering_2, type="l", col = "red"))
#with(SubSetData, plot(Datetime, Sub_metering_3, type="l", col = "blue"))
#legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

