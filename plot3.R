# First loading necessary packages
library("graphics")
library("grDevices")
library("dplyr")

#reading and preparing data
housep <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = class, na.strings= "?")
housep <- mutate( housep, Date = as.Date(Date, "%d/%m/%Y"))
housep_rightdates <- filter (housep, Date > "2007-01-31")
housep_rightdates <- filter (housep_rightdates, Date < "2007-02-03")
housep_rightdates <- mutate (housep_rightdates, DateTime <- paste(Date, Time))

#ajusting the dates and stacking the data 
Submeters <- data.frame(housep_rightdates[10], stack(housep_rightdates[7:9]))
Datetime2 <- strptime(Submeters$DateTime....paste.Date..Time, "%Y-%m-%d %H:%M:%S")

#making the plot
plot(Datetime2, Submeters$values, type="n", xaxt = "s", xlab = "", ylab = "Energy sub metering")
with(subset(Submeters, ind == "Sub_metering_3"), lines (Datetime, values, col = "blue"))
with(subset(Submeters, ind == "Sub_metering_1"), lines (Datetime, values, col = "black"))
with(subset(Submeters, ind == "Sub_metering_2"), lines (Datetime, values, col = "red"))
legend("topright", lwd= 2, col = c("black","red", "blue"), legend = c("Sub_metering_1", " Sub_metering_2", "Sub_metering_3"))

#making the png file
png(filename = "Plot3.png", width = 480, height = 480)
plot(Datetime2, Submeters$values, type="n", xaxt = "s", xlab = "", ylab = "Energy sub metering")
with(subset(Submeters, ind == "Sub_metering_3"), lines (Datetime, values, col = "blue"))
with(subset(Submeters, ind == "Sub_metering_1"), lines (Datetime, values, col = "black"))
with(subset(Submeters, ind == "Sub_metering_2"), lines (Datetime, values, col = "red"))
legend("topright", lwd= 2, col = c("black","red", "blue"), legend = c("Sub_metering_1", " Sub_metering_2", "Sub_metering_3"))
dev.off()

