setwd("z:/ExData_Plotting1")
library(lubridate)
# Read in data for 1st and 2nd February 2007
pollution <- read.table("data/household_power_consumption.txt",skip=grep("1/2/2007",
                                                                         readLines("data/household_power_consumption.txt")),nrows=2879,sep=";")
# Read in first row of datafile and split it to get column names
cnames <- readLines("data/household_power_consumption.txt",1)
cnames <- strsplit(cnames, ";", fixed=TRUE)
# Add column names to data table
names(pollution) <- cnames[[1]]

# Convert first column (Date) to dates
temp <- strptime(pollution$Date,"%e/%m/%Y")
dates <- temp
times <- pollution$Time
x <- paste(dates, times)
pollution$datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")

#plot1

# Produce histogram of Global activity power and write it out to plot1.png
png(file="plot1.png")
hist(pollution$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",
     main="Global Active Power", cex.lab = 1, cex.axis=1)
dev.off()

