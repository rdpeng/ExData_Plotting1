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
png(file = "Plot2.png")

##Plots the line graph with appropritae labels
plot(T, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

##Closes the PNG graphics device
dev.off()