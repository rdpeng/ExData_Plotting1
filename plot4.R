plot4 <- function(path) {
  par(mfrow = c(2, 2), mar = c(2, 2, 2, 2));
  dat <- read_data(path);
  plot(dat$time_stamp, dat$Global_active_power, type = "l", xlab = "", 
    ylab = "Global Active Power");
  plot(dat$time_stamp, dat$Voltage, type = "l", xlab = "datetime", 
    ylab = "Voltage");
  plot(dat$time_stamp, dat$Sub_metering_1, type = "l", xlab = "", 
    ylab = "Energy sub metering");
  lines(dat$time_stamp, dat$Sub_metering_2, col = "red");
  lines(dat$time_stamp, dat$Sub_metering_3, col = "blue");
  legend("topright", col = c("black", "red", "blue"), 
    c("Sub_metering_1       ", "Sub_metering_2      ", "Sub_metering_3       "), 
      lty = c(1, 1), bty = "n", cex = 0.5);
  plot(dat$time_stamp, dat$Global_reactive_power, type = "l", 
    xlab = "datetime", ylab = "Global_reactive_power");
  dev.copy( png, file = "plot4.png", width = 480, height = 480);
  dev.off();
}
