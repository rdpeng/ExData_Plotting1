

#Read the file
file <- "household_power_consumption.txt"
table <- read.table(file, header = TRUE, na.strings = "?", sep = ";")

# set date format and subset by date
table$Date <- as.Date(table$Date, "%d/%m/%Y")
Data <- subset(table, Date == "2007-02-01" | Date == "2007-02-02")

library(data.table)
#set as data table and make new date-time variable (easier on data.table)
setDT(Data)
Data[, dt:= as.POSIXct(paste(Data$Date, Data$Time), format = "%Y-%m-%d %H:%M:%S")]

#Remove NA's
Data <- na.omit(Data)

#Create png file, set the dimensions
png("plot4.png", width = 480, height = 480)


#Set parameter to plot 4 graphs 2x2
par(mfrow = c(2,2))
#Order is top left, top right, bottom left, bottom right

#Top left:
with(Data, plot(dt, Global_active_power, type = "l", 
                ylab = "Global Active Power", xlab = ""))

#Top right:
with(Data, plot(dt, Voltage, type = "l", xlab = "datetime"))

#Bottom left:
with(Data, plot(dt, Sub_metering_1, type = "n", 
                ylab = "Energy sub metering", xlab = ""))
with(Data, lines(dt, Sub_metering_1))
with(Data, lines(dt, Sub_metering_2, col = "red"))
with(Data, lines(dt, Sub_metering_3, col = "blue"))
legend("topright", inset = c(.08, 0), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       y.intersp = 1.5, bty = "n", lwd = 1, col = c('black', 'red', 'blue'))

#Bottom right:

with(Data, plot(dt, Global_reactive_power, type = "l", xlab = "datetime"))

#close graphics device
dev.off()

