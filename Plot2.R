# This will plot the frequency of Global Active power in the dataset
plot.gap2 <- function(data_file, png_file) {
  data <- read_data(data_file)
  png(png_file)
  data$datetime <- as.POSIXct(paste(data$Date, data$Time))
  plot(data$datetime, data$Global_active_power, 
       main = "Global Active Power", type = "n",
       ylab = "Global Active Power (kilowatts)", xlab = "Day of the week")
  lines(data$datetime, data$Global_active_power, type = "l")
  dev.off()
  
}
plot.gap2('household_power_consumption.txt', 'plot2.png')