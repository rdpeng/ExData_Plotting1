# Plot 4: Four charts displayed 2x2 from "household_power_consumption.txt" dataset
setwd("C:/Users/Michelle/dataScience/ExploratoryData")

# Read the text file and handle missing dataset values which are coded as "?" 
mydata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert between character representations and objects of class "Date" representing calendar dates
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

# Subset dates to analyze:  2007-02-01 and 2007-02-02
subsetdata <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Date conversion
datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$datetime <- as.POSIXct(datetime)

# Plot 4 Four plots in a 2x2 configuration
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subsetdata, {
  
# Upper left quadrent is a line chart of Global Active Power vs. Thu / Fri / Sat  (same as Lot 2 assignment)
  plot(Global_active_power~subsetdata$datetime, type="l", 
       ylab="Global Active Power", xlab="")
  
# Upper right quadrent is a line chart of Voltage vs. datetime   
  plot(Voltage~subsetdata$datetime, type="l", 
       ylab="Voltage", xlab="")
  
# Lower left quadrent is a line chart of Energy Sub-metering vs. Thu / Fri / Sat with a legend
  plot(Sub_metering_1~subsetdata$datetime, type="l", 
       ylab="Global sub metering", xlab="")
  lines(Sub_metering_2~subsetdata$datetime,col='Red')
  lines(Sub_metering_3~subsetdata$datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
  
# Lower right quadrent is a line chart of Global Reactive Power vs. Thu / Fri / Sat
  plot(Global_reactive_power~subsetdata$datetime, type="l", 
       ylab="Global_Reactive_Power",xlab="")
})

# Save Plot 4 to a PNG file named "plot4.png" which has a width of 480 pixels and a height of 480 pixels
dev.copy(png, file='plot4.png', height=480, width=480)
dev.off()
