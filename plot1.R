plot1 <- function(path) {
  dat <- read_data(path);
  hist(dat$Global_active_power, col = 'red', 
    xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', 
      main = paste("Global Active Power"));
  dev.copy(png, file = "plot1.png", width = 480, height = 480);
  dev.off();
}
