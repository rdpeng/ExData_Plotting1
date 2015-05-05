##read txt file in which columns are separated by ; and missing values are labeled with ?

power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## first column is Date and this command formats integers into date format
power[[1]] <- as.Date(strptime(power[[1]],format = "%d/%m/%Y"))

## this command subset for specific dates 
powers <- subset(power, Date >= "2007-02-01" & Date <"2007-02-03")
## creation of new column datetime 
powers$datetime <- as.POSIXct(paste(powers$Date, powers$Time), format="%Y-%m-%d %H:%M:%S")

#saving png file of Frequency plot
png(filename = "Plot4.png")
#create matrix space for 4 graphs
par(mfrow =c(2,2))

##Creates Plot Global active power
with(powers, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab=" "))

##Creates Plot Voltage
with(powers, plot(datetime, Voltage, type = "l"))

##Creates Plot Sub

with (powers, plot(datetime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=" "))
lines(powers$datetime, powers$Sub_metering_1)
lines(powers$datetime, powers$Sub_metering_2, col="red")
lines(powers$datetime, powers$Sub_metering_3, col="blue")
##legend insert
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"), bty="n")

##Creates Plot Global reactive power

with(powers, plot(datetime, Global_reactive_power, type = "l"))

dev.off()

