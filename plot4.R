# INSTALLATION OF PACKAGES
install.packages("data.table")
library(data.table)
install.packages("dplyr")
library(dplyr)

# LOADING OF DATA
mydata<-fread("household_power_consumption.txt")
selectData<-
    mydata%>%
    filter(Date=="1/2/2007" | Date=="2/2/2007")

datetime <- strptime(paste(selectData$Date, selectData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# PLOTTING OF CHARTS
png(filename = "plot4.png", 
    width = 480, height = 480)

par(mfcol=c(2,2))

plot(
    datetime,
    as.numeric(selectData$Global_active_power), 
    type="l",
    xlab="",
    ylab = "Global Active Power"
)

plot(
    datetime,
    as.numeric(selectData$Sub_metering_1),
    type="l",
    xlab="",
    ylab = "Energy sub metering"
)
lines(datetime, 
      as.numeric(selectData$Sub_metering_2), 
      type="l", 
      col="red")
lines(datetime, 
      as.numeric(selectData$Sub_metering_3), 
      type="l", 
      col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), 
       lwd=par("lwd"), bty = "n")

plot(
    datetime,
    as.numeric(selectData$Voltage), 
    type="l",
    xlab="datetime",
    ylab = "Voltage"
)

plot(
    datetime,
    as.numeric(selectData$Global_reactive_power), 
    type="l",
    xlab="datetime",
    ylab = "Global_reactive_power"
)

dev.off()
