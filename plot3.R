

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
png("plot3.png", width = 480, height = 480)

#This time I plotted the graph empty of data first
#(I did set the axis labels in the initial arg)
with(Data, plot(dt, Sub_metering_1, type = "n", 
                ylab = "Energy sub metering", xlab = ""))
with(Data, lines(dt, Sub_metering_1))
with(Data, lines(dt, Sub_metering_2, col = "red"))
with(Data, lines(dt, Sub_metering_3, col = "blue"))
legend("topright", inset = c(.07, 0), legend = c("Sub_metering_1", "Sub_metering_2", 
                                                 "Sub_metering_3"), y.intersp = 1.5, bty = "n", lwd = 1, col = c('black', 'red', 'blue'))
#added in each sub_meter variable individually, then the legend.
#Removed box- looks better imo

#Close graphics device
dev.off()



