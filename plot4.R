#load needed packages

insert.packages("data.table")
install.packages("data.table")  
library(data.table)
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)

# read data for the one month interval needed 

dataset <- data.table::fread("C://Users/maure/AppData/Local/Temp/
Temp1_exdata_data_household_power_consumption(2).zip/household_power_consumption.txt", 
                             header = TRUE, sep=';', na.strings = "?") 

# to get rows for the date we are interested in
dataset <- dataset %>% slice(66637:69516)

#combine date and time columns
dataset <- dataset %>% unite(DateTime, c("Date", "Time"))

#Create new DateTime vector with Date class with lubridate
format <- dmy_hms(dataset$DateTime)

#replace DateTime col with format
dataset$DateTime <- format

# plot y = voltage , x = datetime
# first change voltage to a numeric
#create Voltage over time plot

dataset$Voltage <- as.numeric(dataset$Voltage)
#create Global reactive power over time plot
plot(dataset$DateTime, dataset$Global_active_power, type = "l", xlab = '', 
     ylab = "Global Active Power (kilowatts)")

#Create plot4 with the four plots
# the order for final plot 4 (containing 4 plots)is 
#plot 2
#voltage plot
#plot 3
#reactive plot

# Must set up mfrow function to make plot in the assigned order

png(filename = "Rplot4_1.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(dataset$DateTime, dataset$Global_active_power, type = "l", xlab = '', 
     ylab = "Global Active Power (kilowatts)")
plot(dataset$DateTime, dataset$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")
plot(dataset$DateTime, dataset$Sub_metering_1, 
     type = "l", xlab = '', ylab = "Energy sub metering")
lines(dataset$DateTime, dataset$Sub_metering_2, 
      col = "red", xlab = '', ylab = '')
lines(dataset$DateTime, dataset$Sub_metering_3, 
      col = "blue", xlab = '', ylab = '')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                              "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, cex = 1, bty = "n")
plot(dataset$DateTime, dataset$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
