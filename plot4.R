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

# Convert first column to dates
temp <- strptime(pollution$Date,"%e/%m/%Y")
dates <- temp
times <- pollution$Time
x <- paste(dates, times)
pollution$datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")

# plot4
# produce multiple plot comprising plot1, a plot of Voltage by day, plot2 and plot3 and write out to plot4.png

png(file="plot4.png")
par(mfrow = c(2,2))
plot(pollution$datetime,pollution$Global_active_power,type = "n",ylab = "Global Active Power",xlab="") 
lines(pollution$datetime,pollution$Global_active_power)

plot(pollution$datetime,pollution$Voltage,type = "n",ylab = "Voltage", xlab = "datetime") 
lines(pollution$datetime,pollution$Voltage)

plot(pollution$datetime,pollution$Sub_metering_1,type = "n",ylab = "Energy sub metering", xlab="") 
lines(pollution$datetime,pollution$Sub_metering_1)
lines(pollution$datetime,pollution$Sub_metering_2, col="red")
lines(pollution$datetime,pollution$Sub_metering_3, col="blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.font = 0.1, 
       col = c("black", "red", "blue"), lty = 1, bty="n")

plot(pollution$datetime,pollution$Global_reactive_power,type = "n",ylab = "Global_reactive_power", xlab = "datetime") 
lines(pollution$datetime,pollution$Global_reactive_power)
dev.off()