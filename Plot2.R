# This will plot the frequency of Global Active power in the dataset
plot.gap2 <- function(data_file, png_file) {
  data <- read_data(data_file)
  png(png_file, width = 480, height = 480)
  data$datetime <- as.POSIXct(paste(data$Date, data$Time))
  plot(data$datetime, data$Global_active_power, 
       main = "Global Active Power", type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "Day of the week")
  dev.off()
  
}
source('./read_data.R');
plot.gap2('household_power_consumption.txt', 'plot2.png')