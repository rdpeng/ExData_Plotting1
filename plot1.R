# read the data
observation.dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
consumption <- read.csv(
  "household_power_consumption.txt", 
  header = TRUE, 
  na.strings = "?",
  sep = ";"
)
consumption.for.plotting <- consumption[as.Date(consumption$Date, "%d/%m/%Y") %in% observation.dates, ]

png(filename = "plot1.png", width = 480, height = 480)

# draw it
hist(
  consumption.for.plotting$Global_active_power, 
  col = "red", 
  main = "Global Active Power", 
  ylab = "Frequency", 
  xlab = "Global Active Power (kilowatts)"
)

dev.off()