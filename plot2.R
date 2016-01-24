plot2 <- function(path) {
  dat <- read_data(path);
  plot(dat$time_stamp, dat$Global_active_power, type = "l", xlab = "", 
    ylab = "Global Active Power (kilowatts)");
  dev.copy(png, file = "plot2.png", width = 480, height = 480);
  dev.off();
}
