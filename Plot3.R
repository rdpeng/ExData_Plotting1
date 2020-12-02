## Read data containing only the first 2 days in February, 2007
data <- read.table("household_power_consumption.txt", na.strings = "?", 
                   skip = grep("31/1/2007;23:59:00", 
                   readLines("household_power_consumption.txt")), 
                   sep = ";", nrows = 2880)

colnames(data) <- c("date", "time", "global_active_power", 
                    "global_reactive_power", "voltage", 
                    "global_intensity", "sub_metering_1", 
                    "sub_metering_2", "sub_metering_3")
##create new column datetime
library(dplyr)
data$date <- as.Date(data$date, "%d/%m/%Y")
data <- data%>%mutate(datetime = strptime(paste(date, time),"%Y-%m-%d %H:%M:%S"))

#create png file
png(filename = "Plot3.png", width = 480, height = 480)

#plotting
plot(data$datetime, data$sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")
lines(data$datetime, data$sub_metering_1, col = "black")
lines(data$datetime, data$sub_metering_2, col = "red")
lines(data$datetime, data$sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                              "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1, 1, 1), cex = 0.8)

#close off device
dev.off()





