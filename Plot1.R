

#Reads in data from file then subsets data for specified dates
dt <- data.table::fread(input = "./household_power_consumption.txt",na.strings = "?" )

# Prevents histogram from printing in scientific notation
dt[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to Date Type
dt[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]


# Filter Dates for 2007-02-01 and 2007-02-02
dt <- dt[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width = 480, height = 480)
 hist(dt[[3]], main = "Global Active Power",xlab = "Global Active Power(kilowatts)",
              col = "red",xlim = c(0,6))

dev.off()

