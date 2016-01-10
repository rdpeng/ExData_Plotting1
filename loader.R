# Author: Glen Friedman (glen.friedman@gmail.com)
# Reads in power consumption data.

# Faster loading, auto-sets col types.
require(data.table)

# Fast conversion to POSIXct.
require(fasttime)

# Name of file containing power consumption data.
DATA_FILE <- "household_power_consumption.txt"

# Relative path to folder containing power consumption data.
DATA_DIR <- "exdata-data-household_power_consumption"

# Dates whose data we want to examine.
DATES <- c("1/2/2007", "2/2/2007")

get_data <- function() {
  # Read in data file.
  dt <- fread(paste(DATA_DIR, DATA_FILE, sep="/"), na.strings = "?")
  
  # First, filter to look at only 2007-02-01 and 2007-02-02.
  dt <- dt[Date %in% DATES,]
  
  # Convert Date col to Date type.
  dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
  
  # Create POSIXct for each Date + Time value.
  dt$Datetime <- fastPOSIXct(strptime(paste(dt$Date, dt$Time), "%Y-%m-%d %H:%M:%S"))
  
  return(dt)
}
