hh.power3 <- read.csv("hh_power_3.csv")
hh.power3$DateTime <- strptime(paste(hh.power3$Date, hh.power3$Time), "%d/%m/%y%H:%M:%S")
hist(hh.power3$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
