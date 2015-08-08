################################
# Read in and process the data #
################################

#Load chron package
library(chron)

#Read in data and print the first 10 records
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c(rep("character",9)))
print(power[1:10,])

#Subset the data to dates of interest and print the first 10 records
power2 <- power[power$Date=="1/2/2007" | power$Date=="2/2/2007",]
print(power2[1:10,])

#Create DateTime variable
power2$DateTime <- chron(dates=power2$Date, times=power2$Time, format=c(dates="d/m/Y",times="h:m:s"))
class(power2$DateTime)

#Convert Date variable to the Date class
power2$Date <- as.Date(power2$Date, format="%d/%m/%Y")

#Convert Time variable to the times class
power2$Time <- chron(times=power2$Time,format="h:m:s")

#Convert remaining variables to numeric class
power2$Global_active_power   <- as.numeric(power2$Global_active_power)
power2$Global_reactive_power <- as.numeric(power2$Global_reactive_power)
power2$Voltage               <- as.numeric(power2$Voltage)
power2$Global_intensity      <- as.numeric(power2$Global_intensity)
power2$Sub_metering_1        <- as.numeric(power2$Sub_metering_1)
power2$Sub_metering_2        <- as.numeric(power2$Sub_metering_2)
power2$Sub_metering_3        <- as.numeric(power2$Sub_metering_3)

#Confirm variable classes
class(power2$Date)
class(power2$Time)
class(power2$DateTime)
class(power2$Global_active_power)
class(power2$Global_reactive_power)
class(power2$Voltage)
class(power2$Global_intensity)
class(power2$Sub_metering_1)
class(power2$Sub_metering_2)
class(power2$Sub_metering_3)

#Print the first 10 records of power2
print(power2[1:10,])

################
# Create plot4 #
################

#Open device
png(filename="plot4.png", width=480, height=480)

#Create frame
par(mfrow=c(2,2))

#Create plot4A, a line plot of Global_active_power vs. DayOfWeek
plot(x=power2$DateTime, y=power2$Global_active_power, type="l", xaxt="n", xlab="", ylab="Global Active Power")
axis(1, at=c(13545,13546,13547), labels=c("Thu","Fri","Sat"))

#Create plot4B, a line plot of Voltage vs. DayOfWeek
plot(x=power2$DateTime, y=power2$Voltage, type="l", xaxt="n", xlab="datetime", yaxt="n", ylab="Voltage")
axis(1, at=c(13545,13546,13547), labels=c("Thu","Fri","Sat"))
axis(2, at=c(234,236,238,240,242,244,246), labels=c("234","","238","","242","","246"))

#Create plot4C, a line plot of Global_active_power vs. DayOfWeek by Sub_meter
plot(x=power2$DateTime, y=power2$Sub_metering_1, type="l", col="black", xaxt="n", xlab="", ylab="Energy sub metering")
axis(1, at=c(13545,13546,13547), labels=c("Thu","Fri","Sat"))
lines(x=power2$DateTime, y=power2$Sub_metering_2, col="red")
lines(x=power2$DateTime, y=power2$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), bty="n")

#Create plot4D, a line plot of Global_reactive_power vs. DayOfWeek
plot(x=power2$DateTime, y=power2$Global_reactive_power, type="l", xaxt="n", xlab="datetime", yaxt="n", ylab="Global_reactive_power")
axis(1, at=c(13545,13546,13547), labels=c("Thu","Fri","Sat"))
axis(2, at=c(0.0,0.1,0.2,0.3,0.4,0.5), labels=c("0.0","0.1","0.2","0.3","0.4","0.5"))

#Close device
dev.off()
