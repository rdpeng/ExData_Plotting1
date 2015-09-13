#Read in household power consumption data
if(!file.exists("exdata-data-household_power_consumption.zip")) {
  x <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",x)
  power <- unzip(x)
  unlink(x)
}
household_power_consumption <- read.table(power, header=TRUE, sep=";",na.strings="?")

#Subset data to two dates we are interested in
power_consump <- subset(household_power_consumption,Date == "1/2/2007" | Date == "2/2/2007" )

#Put date and time into one string, changes order and puts it into new column
power_consump$DateTime <- strptime(paste(power_consump$Date,power_consump$Time), "%d/%m/%Y %H:%M:%S")

#Opens png file device
png(file="plot4.png")

#sets window with 4 graphs ordered by row
par(mfrow = c(2,2))

#Plot in 1st row and 1st column of day vs global active power
plot(power_consump$DateTime, power_consump$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

#Plot in 1st row and 2nd column of day vs voltage
plot(power_consump$DateTime, power_consump$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Plot in 2nd row and 1st column of day vs submetering 1, 2 and 3 data
plot(power_consump$DateTime,power_consump$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(power_consump$DateTime,power_consump$Sub_metering_2,type="l",col="red")
lines(power_consump$DateTime,power_consump$Sub_metering_3,type="l",col="blue")

#Plot in 2nd row and 2nd column of day vs global reactive power
plot(power_consump$DateTime, power_consump$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Close device
dev.off()