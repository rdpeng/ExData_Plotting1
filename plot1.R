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
# Create plot1 #
################

#Create plot1, a histogram of Global_active_power
png(filename="plot1.png", width=480, height=480)
hist(power2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

