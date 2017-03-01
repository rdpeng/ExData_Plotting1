plot2 <- function() {
  # Rough calculation of memory
  # 2,075,259 rows x 9 columns x 8 bytes/(double/string) = .14 gb
  # plenty of space
  # used grep to find the first row and 
  # used as.Date(dates, "%d/%m/%Y")
  
  # Creates header because I'm skipping lines when I read in body
  header <- read.table("household_power_consumption.txt", nrow = 1, header = FALSE, sep = ";")
  # Only reads in data for dates I care about
  householdPowerConsumption <- read.table("household_power_consumption.txt", head = FALSE, sep = ";", skip = 66637, nrow = 2880)
  
  # The above loads in the header and the data for the dates we care about.
  names(householdPowerConsumption) <- as.character(unlist(header))
  
  # Number of observations
  numberOfObservations <- dim(householdPowerConsumption)[1]
  
  # Create a histogram with global active power users on the x and frequency on the y
  png(file = "plot2.png", width = 480, height = 480)
  plot(householdPowerConsumption$Global_active_power, ylab = "Global Active Power (kilowatts)", type = 'l', xaxt="n", xlab = "") #xaxt="n" removes the ticks
  xtick <- c(0, numberOfObservations/2, numberOfObservations)
  axis(side = 1, at=xtick, labels = c("Thu", "Fri", "Sat"))
  dev.off() #uncomment this when not plotting to rstudio plot pane
}