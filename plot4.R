library(data.table)

# load only data from rows starting with 1/2/2007 or 2/2/2007
cols <- colnames(fread("data/household_power_consumption.txt", nrows = 0))
data <- fread("grep ^[12]/2/2007 data/household_power_consumption.txt")
setnames(data, cols)

# combine the Date and Time columns into something useful
data[, DateTime := as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))]

# make plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# top left sub-plot
with(data, {
    plot(DateTime, Global_active_power, type = "n", xlab = "",
         ylab = "Global Active Power")
    lines(DateTime, Global_active_power, type = "l")
})

# top right sub-plot
with(data, {
    plot(DateTime, Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
    lines(DateTime, Voltage, type = "l")
})

# bottom left sub-plot
cols <- c("black", "red", "blue")
with(data, {
    plot(DateTime, Sub_metering_1, type = "n", xlab = "",
         ylab = "Energy sub metering")
    lines(DateTime, Sub_metering_1, type = "l", col = cols[1])
    lines(DateTime, Sub_metering_2, type = "l", col = cols[2])
    lines(DateTime, Sub_metering_3, type = "l", col = cols[3])
})
legend("topright", legend = names(data)[7:9], lty = 1, col = cols, bty = "n")

# bottom right sub-plot
with(data, {
    plot(DateTime, Global_reactive_power, type = "n", xlab = "datetime")
    lines(DateTime, Global_reactive_power, type = "l")
})

dev.off()
