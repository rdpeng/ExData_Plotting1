library(dplyr)
library(data.table)

# reads in data from file then subsets data for specified dates
fh <- fread("./household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
pwrcons <- filter(fh, grep("^[1,2]/2/2007", Date))

# convert global active power column, Sub_metering columns, Voltage column, 
#and global reactive power colums to numeric
pwrcons$Global_active_power <- as.numeric(as.character(pwrcons$Global_active_power))

pwrcons$Sub_metering_1 <- as.numeric(as.character(pwrcons$Sub_metering_1))
pwrcons$Sub_metering_2 <- as.numeric(as.character(pwrcons$Sub_metering_2))
pwrcons$Sub_metering_3 <- as.numeric(as.character(pwrcons$Sub_metering_3))

pwrcons$Voltage <- as.numeric(as.character(pwrcons$Voltage))

pwrcons$Global_reactive_power <- as.numeric(as.character(pwrcons$Global_reactive_power))

#Creates new column that combines date and time data 
pwrcons$Timestamp <-paste(pwrcons$Date, pwrcons$Time)


#Sets graphing parameters so that 4 graphs are drawn by column
par(mfcol = c(2,2))


# Creates graph of date/time vs global active power data
plot(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")


#Creates 2nd graph in column 1 
#Creates plot of date/time v Sub metering 1 data
plot(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

#Adds line graph for date/time v Sub metering 2 data in red
lines(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Sub_metering_2, type = "l", col = "red" )

#Adds line graph for date/time v Sub metering 3 data in blue
lines(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Sub_metering_3, type = "l", col = "blue" )

#Adds legend to graph
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Creates first graph in column 2
#This graphs date/time v Voltage
plot(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

#Creates second graph in column 2
#This plots datetime v global reactive power
plot(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

## Save graph as png file
dev.copy(png, file = "plot4.png")
dev.off()
