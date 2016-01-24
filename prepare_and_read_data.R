read_data <- function(path) {
  setwd(path);
  library(data.table);
  full_dat <- fread('household_power_consumption.txt', sep = ';', na.strings = '?');
  dat <- full_dat[full_dat$Date == '1/2/2007' | full_dat$Date == '2/2/2007'];
  dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y");
  dat <- transform(dat, time_stamp = as.POSIXct(paste(Date, Time)), 
    "%d/%m/%Y %H:%M:%S");
  dat;
}
