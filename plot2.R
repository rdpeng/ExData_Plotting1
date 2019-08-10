my_data <- read.table('household_power_consumption.txt', header=TRUE, sep = ";", 
                      dec = ".", na.strings = "?", colClasses = c(NA, NA, rep ("numeric", 7)))
date1 <- as.Date("01/02/2007","%d/%m/%Y")
date2 <- as.Date("02/02/2007", "%d/%m/%Y")
date_table <- as.Date(my_data$Date, "%d/%m/%Y")

hpc <- my_data[date_table>=date1 & date_table<=date2,]

png("plot2.png", width=480, height=480)

date_time <- paste(hpc$Date,hpc$Time)
dt <- strptime(date_time, format="%d/%m/%Y %H:%M:%S")
plot(dt,
     hpc$Global_active_power,
     type="l",
     col=I("black"), 
     main = "",
     xlab = "",
     ylab="Global Active Power (kilowatts)")
dev.off()
