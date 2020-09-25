library("data.table")

data <- data.table::fread(input = "F:/R_basics/household_power_consumption.txt", na.strings="?")


data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

powerDT <- data[(dateTime >= "2007-02-01") & (dateTime <="2007-02-02")]

png("F:/R_basics/Plotting_data/plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(x = powerDT[, dateTime], y = powerDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(powerDT[, dateTime],powerDT[, Voltage], type="l", xlab="datetime", ylab="Voltage")

plot(powerDT[, dateTime], powerDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerDT[, dateTime], powerDT[, Sub_metering_2], col="red")
lines(powerDT[, dateTime], powerDT[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

plot(powerDT[, dateTime], powerDT[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()