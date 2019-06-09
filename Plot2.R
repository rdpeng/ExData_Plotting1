

#Reads in data from file then subsets data for specified dates
dt <- data.table::fread(input = "./household_power_consumption.txt",na.strings = "?" )

# Convert global activer power to numeric
dt[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Concatinate date & time into 1 column so that date can be easily filtered
dt[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter dates for 2007-02-01 and 2007-02-02
dt <- dt[(dateTime >= "2007-02-01")&(dateTime < "2007-02-03")]


png("plot2.png", width = 480, height = 480)

## Plot

x = dt[[10]] # DateTime
y = dt[[3]] # Global Active Power
 plot(x,y, xlab = "",ylab = "Global Active Power(kilowatts)",type = "l",)

dev.off()

