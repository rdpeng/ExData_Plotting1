## Read data containing only the first 2 days in February, 2007
data <- read.table("household_power_consumption.txt", na.strings = "?", 
                   skip = grep("31/1/2007;23:59:00", 
                   readLines("household_power_consumption.txt")), 
                   sep = ";", nrows = 2880)

colnames(data) <- c("date", "time", "global_active_power", 
                    "global_reactive_power", "voltage", 
                    "global_intensity", "sub_metering1", 
                    "sub_metering2", "sub_metering3")
##create new column datetime
library(dplyr)
data$date <- as.Date(data$date, "%d/%m/%Y")
data <- data%>%mutate(datetime = strptime(paste(date, time),"%Y-%m-%d %H:%M:%S"))

#create png file
png(filename = "Plot2.png", width = 480, height = 480)

#plotting
plot(data$datetime, data$global_active_power, 
     type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
#close off device
dev.off()





