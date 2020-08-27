library("data.table")

data <- data.table::fread(input = "F:/R_basics/household_power_consumption.txt", na.strings="?")
data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

powerDT <- data2[(dateTime >= "2007-02-01") & (dateTime <="2007-02-02")]

png("F:/R_basics/Plotting_data/plot2.png", width=480, height=480)


plot(x = powerDT[, dateTime], y = powerDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()