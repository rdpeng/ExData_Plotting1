# Set the working directory
setwd("d:Coursera R/Exploratory Data Analysis")

# Set output to png file
png("Plot1.png")

# Read 100 rows, get the classes of the data columns
testdata <- read.table("household_power_consumption.txt", nrows = 100, sep=";", header=TRUE, na.strings = c("?"))
classes <- sapply(testdata,class)


# Read in all 2 million rows to "mydata", 
# substituting "NA" entries for any missing data indicated by "?"
# and specifiying the classes of each column's data
mydata <- read.table("household_power_consumption.txt", na.strings = c("?"), header = TRUE, colClasses = classes, nrows = 2075259, sep=";")

# Draw the plot of global Active Power for a subset of the total data frame, ie  for Feb 1-2, 2007
# with title and x-axis label
with(subset(mydata,(Date == "1/2/2007" | Date == "2/2/2007")), {hist(Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)") })

# Free up the graphical device
dev.off()
