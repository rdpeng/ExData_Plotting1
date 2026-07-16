# Load the data and subset it
data1 = read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                  na.strings = "?")
data1$DateTime = as.POSIXct(paste(data1$Date, data1$Time), format="%d/%m/%Y %H:%M:%S")
data = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data = rbind(data, data1[which(data1$DateTime == 
                                 as.POSIXct("03/02/2007 00:00:00", 
                               format="%d/%m/%Y %H:%M:%S")),])

# Create a time series plot
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)", xaxt = "n")

thu_start <- min(data$DateTime) 
fri_start <- thu_start + 86400
sat_start <- max(data$DateTime)
ticks = c(thu_start, fri_start, sat_start)

axis.POSIXct(1, at = ticks, format = "%a")

# Copy the plot to png
dev.copy(png, "plot2.png")
dev.off()