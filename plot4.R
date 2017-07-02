decDT <- function(s)  # There will be a better way on doing this
{ 
   y <- as.numeric(substr(s,1,4))
   mon <- as.numeric(substr(s,6,7))
   d <- as.numeric(substr(s,9,10))
   h <- as.numeric(substr(s,12,13))
   min <- as.numeric(substr(s,15,16))
   
   decDT = y + mon/12.+ (d + (h + min/60.)/24.) /365.25  # approximate, but good enough?
}  

setwd("F:/Projects/JHU/Course 4 EDA")
getwd()
# Get Data
D <- read.csv('household_power_consumption.txt',header = TRUE, sep = ";")
D$ADate <- as.Date(D$Date,"%d/%m/%Y")
DSub <- D[which(D$ADate == "2007-02-01" | D$ADate == "2007-02-02"),]

DSub$Global_active_power <- as.numeric(DSub$Global_active_power)

DSub$NewDT <- decDT(paste(DSub$ADate,DSub$Time))
DSub$Sub_metering_1 <- as.numeric(DSub$Sub_metering_1)
DSub$Sub_metering_2 <- as.numeric(DSub$Sub_metering_2)
DSub$Sub_metering_3 <- as.numeric(DSub$Sub_metering_3)
DSub$Voltage <- as.numeric(DSub$Voltage)

par(mfrow=c(2,2))  # 2 Rows, 2 Cols - Rows first
plot(DSub$NewDT,DSub$Global_active_power,   type="l", xlab="", ylab="Global Active Power") # 1st
plot(DSub$NewDT,DSub$Voltage,               type="l", xlab="datetime", ylab="Voltage")     # 2nd

plot(DSub$NewDT,DSub$Sub_metering_1,        type="l", xlab="", ylab="Energy sub metering") # 3rd
lines(DSub$NewDT,DSub$Sub_metering_2,col="red")
lines(DSub$NewDT,DSub$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "),lty=c(1,1), lwd=c(1,1), cex= .6)
# normal lines

# R text font size
#Use cex.axis for the numbers on the axes.
#You can set the font size using cex ,
# but using a value of 1 actually sets the font to 1.5 times the default!!!
# You need to use cex=2/3 to get the default font size.Nov 22, 2010

plot(DSub$NewDT,DSub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  #4th

dev.copy(png,'plot4.png', width=480, height=480)
dev.off()

