# This will plot the frequency of Global Active power in the dataset
plot.subm <- function(data_file, png_file) {
  data <- read_data(data_file)
  png(png_file)
  data$datetime <- as.POSIXct(paste(data$Date, data$Time))
  data$maxSubMeter <- apply(data[,7:9], 1, max)
  plot(data$datetime, data$maxSubMeter, 
       main = "Energy Sub Metering", type = "n",
       ylab = "Energy sub-metering", xlab = "Day of the week")
  lines(data$datetime, data$Sub_metering_1, type = "l", col = "black")
  lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
  lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
  legend("topright", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = c(1,1,1));
  dev.off()
  
}
source('./read_data.R');
plot.subm('household_power_consumption.txt', 'plot3.png')