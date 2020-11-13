setwd("~/ONLINE COURSES/DATA SCIENCE/Coursera Data Science/Electrical Power Consumption Dataset")

### Reads in data from file 
dataFile <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

### Prevents Scientific Notation
dataFile[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

### Making a POSIXct date capable of being filtered and graphed by time of day
dataFile[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

### Filter Dates for 2007-02-01 and 2007-02-02
dataFile <- dataFile[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

### Set Working Directory to Desktop as png can't save to hard disk directly
setwd("C:/Users/Dux")

png("plot2.png", width=480, height=480)

### Plot 2
plot(x = dataFile[, dateTime]
     , y = dataFile[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
### Close the file
dev.off()
