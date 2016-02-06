

# Red histogram of global active power with explicit x-label and title, default y-label, and no legend
do.plot1 <- function(x) {
  hist(x$Global_active_power, col="red",
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)")
  
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

png("plot1.png", width=480, height=480, bg=bg.color)
do.plot1(x)
dev.off()