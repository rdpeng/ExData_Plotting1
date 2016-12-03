

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
png("plot2.png", width = 480, height = 480)

#line chart of GAP over time(dt):
with(Data, plot(dt, Global_active_power, type = "l", 
                ylab = "Global Active Power (kilowatts)", xlab = ""))

#Close graphics device
dev.off()



