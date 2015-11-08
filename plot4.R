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

#ajusting the dates and stacking the data for graph 1,2,4
Datetime <- strptime(housep_rightdates$DateTime, "%Y-%m-%d %H:%M:%S")

#ajusting the dates and stacking the data for graph 3
Submeters <- data.frame(housep_rightdates[10], stack(housep_rightdates[7:9]))
Datetime2 <- strptime(Submeters$DateTime....paste.Date..Time, "%Y-%m-%d %H:%M:%S")


#ploting the Graphs and saving in a png file
par (mfrow = c(2,2))
plot(Datetime, housep_rightdates$Global_active_power, type ="l", ylab ="Global Active Power", xlab = " ", xaxt = "s")
plot(Datetime, housep_rightdates$Voltage, type ="l", ylab ="Voltage", xlab = "datetime", xaxt = "s")
plot(Datetime2, Submeters$values, type="n", xaxt = "s", xlab = "", ylab = "Energy sub metering")
  with(subset(Submeters, ind == "Sub_metering_3"), lines (Datetime, values, col = "blue"))
  with(subset(Submeters, ind == "Sub_metering_1"), lines (Datetime, values, col = "black"))
  with(subset(Submeters, ind == "Sub_metering_2"), lines (Datetime, values, col = "red"))
plot(Datetime, housep_rightdates$Global_reactive_power, type ="l", ylab ="Global_reactive_power", xlab = "datetime", xaxt = "s")

png(filename = "Plot4.png", width = 480, height = 480)
par (mfrow = c(2,2))
plot(Datetime, housep_rightdates$Global_active_power, type ="l", ylab ="Global Active Power", xlab = " ", xaxt = "s")
plot(Datetime, housep_rightdates$Voltage, type ="l", ylab ="Voltage", xlab = "datetime", xaxt = "s")
plot(Datetime2, Submeters$values, type="n", xaxt = "s", xlab = "", ylab = "Energy sub metering")
  with(subset(Submeters, ind == "Sub_metering_3"), lines (Datetime, values, col = "blue"))
  with(subset(Submeters, ind == "Sub_metering_1"), lines (Datetime, values, col = "black"))
  with(subset(Submeters, ind == "Sub_metering_2"), lines (Datetime, values, col = "red"))
plot(Datetime, housep_rightdates$Global_reactive_power, type ="l", ylab ="Global_reactive_power", xlab = "datetime", xaxt = "s")
dev.off()

