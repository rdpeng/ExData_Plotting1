#Reading Data placed in current working directory
data <- read.table("./household_power_consumption.txt", 
                   header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings = "?")
#Subsetting data to fetch records of specified date
subSetData <- subset(data,data$Date %in% c("1/2/2007","2/2/2007"))
#Converting character to date format
subSetData$Date <- as.Date(subSetData$Date,format = "%d/%m/%Y")
#Conactinating and converting in Date Time format 
datetime<-strptime(paste(subSetData$Date, subSetData$Time, sep=" "),
                   format = "%Y-%m-%d %H:%M:%S")
#Char to NUmeric conversion
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
##############Plot4#########
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()