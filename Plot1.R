##This code constructs a histogram of Global Active Power from the subset of data
## and creates a PNG file for it

##Loads the data.table library into R
library(data.table)

##Reads the .txt file into R, converting all "?" into NAs
data <- fread("course4/household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)

##Subsets the dataset, only keeping the required data
data2 <- subset(data, data$Date == "1/2/2007" |
                      data$Date == "2/2/2007")

##Creates a numeric variable for the Global Active Power
GAP <- as.numeric(data2$Global_active_power)

##Opens the PNG Graphic Device adn creates a file called "Plot 1.png"
png(file = "Plot1.png")

##Creates a histogram of the required data, with the appropriate color, Title, and X-Label
hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Closes the PNG graphics device
dev.off()