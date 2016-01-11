# Creates graph of date/time vs global active power data
plot(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
