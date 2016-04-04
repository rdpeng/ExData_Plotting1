read_and_datetime <- function(file) {
  data <- read_data(file)
  data$datetime <- as.POSIXct(paste(data$Date, data$Time))
  return(data)
}

plot1 <- function(data) {
  plot(data$datetime, data$Global_active_power, type = "l",
       ylab = "Global Active Power", xlab = "datetime")
}

plot2 <- function(data) {
  plot(data$datetime, data$Voltage, type = "l",
       ylab = "Voltage", xlab = "datetime")
}

plot3 <- function(data) {
  data$maxSubMeter <- apply(data[,7:9], 1, max)
  plot(data$datetime, data$maxSubMeter, type = "n",
       ylab = "Energy sub-metering", xlab = "datetime")
  lines(data$datetime, data$Sub_metering_1, type = "l", col = "black")
  lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
  lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
  legend("topright", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = c(1,1,1));
}

plot4 <- function(data) {
  plot(data$datetime, data$Global_reactive_power, type = "l",
       ylab = "Global Reactive Power", xlab = "datetime")
}

plot_graphs <- function(data_file, png_file) {
  data <- read_and_datetime(data_file)
  png(png_file, width = 480, height = 480)
  par(mfrow = c(2,2))
  plot1(data)
  plot2(data)
  plot3(data)
  plot4(data)
  dev.off()
}

source('./read_data.R')
plot_graphs('household_power_consumption.txt', 'plot4.png')