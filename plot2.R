# This script downloads data from the UC Irvine Machine Learning Repo and plots out one of four
# graphs to examine how household energy usage varies over a 2-day period in February, 2007
# Another earthkwaque joint, Jan 2015

library(data.table) #Using the data.table library for fast read times

# Changes working directory to forked repository
setwd("/Users/earthkwaque/Projects/rdata/ExData_Plotting1")

# Downloads and unzips the file
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "household_power_consumption.zip", method="curl")
unzip("household_power_consumption.zip", overwrite = TRUE)
file <- "household_power_consumption.txt"

# Reads all data in the file
ALL <- suppressWarnings(fread(file, na.strings="?"))

# Sets the key to Date and subsets the downloaded data set by the needed dates
# and converts the relevant field to numeric
setkey(ALL, Date)
DT <- ALL[c("1/2/2007","2/2/2007"),]

# Plots line graph with given parameters
plot(DT$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "", cex.axis= 0.6, cex.lab = 0.6, axes=FALSE)
axis(1, at=c(1,2880/2,2880), lab=c("Thu", "Fri", "Sat"), cex.axis=0.8)
axis(2, cex.axis=0.8, ylab = "Global Active Power (kilowatts)")
box()

# Copies plot to png
dev.copy(png, file = "plot2.png")
dev.off()