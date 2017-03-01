plot1 <- function() {
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

	# Create a histogram with global active power users on the x and frequency on the y
	png(file = "plot1.png", width = 480, height = 480)
	hist(householdPowerConsumption$Global_active_power, main="Global Active Power",col = "red", xlab = "Global Active Power (kilowatts)")
	axis(side = 2, at=c(0, 200, 400, 600, 800, 1000, 1200))
	dev.off()
}