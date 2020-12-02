## Read data containing only the first 2 days in February, 2007
data <- read.table("household_power_consumption.txt", na.strings = "?", 
                   skip = grep("31/1/2007;23:59:00", 
                   readLines("household_power_consumption.txt")), 
                   sep = ";", nrows = 2880)

colnames(data) <- c("date", "time", "global_active_power", 
                    "global_reactive_power", "voltage", 
                    "global_intensity", "sub_metering1", 
                    "sub_metering2", "sub_metering3")
##change class of date and time
library(chron)
data$date <- as.Date(data$date, "%d/%m/%Y")
data$time <- times(data$time)

#create png file
png(filename = "plot1.png", width = 480, height = 480)
#plotting
hist(data$global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
#close off device
dev.off()




