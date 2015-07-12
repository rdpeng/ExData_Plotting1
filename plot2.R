library(data.table)

# load only data from rows starting with 1/2/2007 or 2/2/2007
cols <- colnames(fread("data/household_power_consumption.txt", nrows = 0))
data <- fread("grep ^[12]/2/2007 data/household_power_consumption.txt")
setnames(data, cols)

# combine the Date and Time columns into something useful
data[, DateTime := as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))]

# make plot 2
png("plot2.png", width = 480, height = 480)
with(data, {
    plot(DateTime, Global_active_power, type = "n", xlab = "",
         ylab = "Global Active Power (kilowatts)")
    lines(DateTime, Global_active_power, type = "l")
})
dev.off()
