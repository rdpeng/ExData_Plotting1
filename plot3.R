library(data.table)

# load only data from rows starting with 1/2/2007 or 2/2/2007
cols <- colnames(fread("data/household_power_consumption.txt", nrows = 0))
data <- fread("grep ^[12]/2/2007 data/household_power_consumption.txt")
setnames(data, cols)

# combine the Date and Time columns into something useful
data[, DateTime := as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))]

# make plot 3
png("plot3.png", width = 480, height = 480)
cols <- c("black", "red", "blue")
with(data, {
    plot(DateTime, Sub_metering_1, type = "n", xlab = "",
         ylab = "Energy sub metering")
    lines(DateTime, Sub_metering_1, type = "l", col = cols[1])
    lines(DateTime, Sub_metering_2, type = "l", col = cols[2])
    lines(DateTime, Sub_metering_3, type = "l", col = cols[3])
})
legend("topright", legend = names(data)[7:9], lty = 1, col = cols)
dev.off()
