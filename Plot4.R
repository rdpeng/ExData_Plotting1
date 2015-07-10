#set working directory
setwd("C:/Users/tejones/Desktop/Coursera/exdata-data-household_power_consumption")

library(gsubfn)
library(Hmisc)
library(chron)
#install.packages("gsubfn")

L <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)


L$Date <- as.Date(L$Date, format = "%d/%m/%Y")

L3 <- L[L$Date == "2007-02-02" | L$Date == "2007-02-01",] #| L$Date == "01/02/2007"),]


L3$Global_active_power <- as.numeric(as.character(L3$Global_active_power))

L3$Date2 <- as.POSIXct(paste(L3$Date,L3$Time), "%d/%m/%Y %H:%M:%S" )


# plot 4
png(file = "plot4.png",  width = 480, height = 480, bg = "transparent")
par(mfrow = c(2,2))
with(L3, {
  plot(L3$Date2,as.numeric(L3$Global_active_power), type = "l", xlab="", ylab="Global Active Power (kilowatts)")
  plot(L3$Date2, as.numeric(L3$Voltage), type = "l",ylab = "Voltage", xlab = "datetime")
  plot(L3$Date2, as.numeric(L3$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
  lines(L3$Date2, as.numeric(L3$Sub_metering_2), type="l", col="red")
  lines(L3$Date2, as.numeric(L3$Sub_metering_3), type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  plot(L3$Date2,as.numeric(L3$Global_reactive_power), type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})
dev.off()
