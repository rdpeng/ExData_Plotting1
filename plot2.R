

# Line plot of global active power with no x-label or title, explicit y-label, and no legend
do.plot2 <- function(x) {
  with(x, {
    plot(datetime, Global_active_power, type="l", xlab="",
         ylab="Global Active Power (kilowatts)")
  }) # end of with() block
  
}


# Load and filter household power consumption dataset
load.power.data <- function(filepath) {
  # Just read the whole thing
  x <- read.table(filepath, sep=";", header=TRUE, na.strings="?")
  
  # Create a new "datetime" column with type POSIXlt by combining the existing Date and Time columns
  x$datetime <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
  
  # Return only the subset of dates we are interested in as given in the assignment description
  dates <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
  x[as.Date(x$datetime) %in% dates,]
}



x <- load.power.data("./household_power_consumption.txt")

png("plot2.png", width=480, height=480, bg=bg.color)
do.plot2(x)
dev.off()