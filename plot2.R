Sys.setlocale("LC_TIME", "English")
## [1] "English_United States.1252"

date_converted <- as.Date(data[, 1], format = "%d/%m/%Y")
time_converted <- strptime(data[, 2], format = "%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, data[, 2]))

plot(time_axis, data[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")