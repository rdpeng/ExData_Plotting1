# This will plot the frequency of Global Active power in the dataset
plot.gap <- function(data_file, png_file) {
  data <- read_data(data_file)
  png(png_file)
  hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
       ylab = "Frequency", main = "Global Active Power")
  dev.off()
  
}
plot.gap('household_power_consumption.txt', 'plot1.png')