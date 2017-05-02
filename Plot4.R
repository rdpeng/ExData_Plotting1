##Plots the Global Active Power as a function of Time

##Loads data.table from the library
library(data.table)

##Reads the .txt file into a data table
data <- fread("course4/household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)

##Subsets the data table to only look at the relevant dates
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

##Creates a numeric variable for Global Active Power
GAP <- as.numeric(as.character(data2$Global_active_power))

##Creates a new variable TS as a paste of Date and Time strings
data2$TS <- paste(data2$Date, data2$Time)

##Creates a new Time Variable using strptime
T <- strptime(data2$TS, "%d/%m/%Y %H:%M:%S")

##Opens the PNG graphics device
png(file = "Plot4.png")

##Sets the Graphs to accomodate 2 rows and 2 columns
par(mfcol = c(2,2))


##Plots the line graph with appropritae labels in Row 1, Col 1
plot(T, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

##Plots in Row 2, Col 1
##Plots the line graph of sub meter 1 with appropritae labels
plot(T, data2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

##Plots the line graphs of sub meters 2 and 3
lines(T, data2$Sub_metering_2, type = "l", col = "red")
lines(T, data2$Sub_metering_3, type = "l", col = "blue")

##Adds a legend to the graphs with appropriate coloring and labels
legend("topright", lty = 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Plots Voltage as a function of Time in Row 1, Col 2
plot(T, data2$Voltage, type ="l", xlab ="datetime", ylab = "Voltage")

##Plots Global Reactive Power as a function of Time in ROw 2, Col 2
plot(T, data2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

##Closes the PNG graphics device
dev.off()