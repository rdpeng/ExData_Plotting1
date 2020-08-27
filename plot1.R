library("data.table")

data <- data.table::fread(input = "F:/R_basics/household_power_consumption.txt", na.strings="?")
data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
data[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

powerDT <- data[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("F:/R_basics/Plotting_data/plot1.png", width=480, height=480)

hist(powerDT[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()