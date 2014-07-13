## This code reads the data from a .txt file in the working directory
## The name of the file is household_power_consumption.txt

library("chron")

## First at all let's clean the data

# First I follow Dr. Pens's advice and just read the first 5 data points
# to check the data classes (note that the NAs are written as "?")

Dat5rows <- read.table("household_power_consumption.txt", header = T, sep = ";",
	na.strings = "?", nrows = 5, stringsAsFactors = F)
classes <- sapply(Dat5rows, class)	# check the classes, to save memory

# Reading the whole file (now using colClasses)
# Number of registers ~ 2,080,000
Data <- read.table("household_power_consumption.txt", header = T, sep = ";",
	colClasses = classes, na.strings = "?", nrows = 2080000)
# Transform the dates from "character" to "date" objects
Data$Time <- strptime(paste(Data$Date,Data$Time),format='%d/%m/%Y %H:%M:%S')
Data$Date <- as.Date(Data$Date,format='%d/%m/%Y')

# Finally let's subset our dates of interest
lilData <- Data[with(Data, Date=="2007-2-1"|Date=="2007-2-2"), ]

## Ok, now we can do the plots