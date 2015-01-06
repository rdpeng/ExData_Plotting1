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

# plot3
# produce plot of different sub metering energy by day and save it to plot3.png
png("plot3.png")
plot(pollution$datetime,pollution$Sub_metering_1,type = "n",ylab = "Energy sub metering", xlab="", cex.lab = 1, cex.axis = 1) 
lines(pollution$datetime,pollution$Sub_metering_1)
lines(pollution$datetime,pollution$Sub_metering_2, col="red")
lines(pollution$datetime,pollution$Sub_metering_3, col="blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  
       col = c("black", "red", "blue"), lty = 1)
dev.off()
