library(data.table)
library(dplyr)
library(lubridate)
power <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";")
# Read file of 2075259 obs and of 9 variables

power$Date <- dmy(power$Date) # changing the format of Date columns
power <- power %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02") # subsetting power to the required dates
# new file of 2880 obs and of 9 variables

power$datetime <- as.POSIXct(paste(power$Date, power$Time, format = "%d/%m/%Y %H:%M:%S")) 
# adding new column of combined date time
# new file of 2880 obs and of 10 variables (new colum added for datetime)

power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
# converting factors into numeric # making the factors to numeric. first make into charcters, then numeric

png("plot 3.png", height = 480, width = 480) # setting the output
plot (x = power$datetime, y = power$Sub_metering_1, type = "l",  xlab="", ylab="Energy sub metering") 
lines(x = power$datetime, y = power$Sub_metering_2, col = "red")
lines(x = power$datetime, y = power$Sub_metering_3,col = "blue")
legend("topright", col = c("Black", "red", "blue"),  c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
dev.off() # closing the file



