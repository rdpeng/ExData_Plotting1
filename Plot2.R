## read data
power <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## Create column in table with date and time merged together
Full <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power <- cbind(powerdata, Full)

## change class of all columns to correct class
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- format(power$Time, format="%H:%M:%S")
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Voltage <- as.numeric(power$Voltage)
power$Global_intensity <- as.numeric(power$Global_intensity)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

## subset data from 2007-02-01 and 2007-02-02
subsetdata <- subset(power, Date == "2007-02-01" | Date =="2007-02-02")

## plot globalactivepower vs date&time
png("plot2.png", width=480, height=480)
with(subsetdata, plot(Full, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()

