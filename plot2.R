--change directory to assignment1 in data exploration file
--this is where I saved data file. 

data1 <- read.csv("household_power_consumption.csv")
head(data1)

##for plot 2, need to plot date/time by global active power. 
##create data2 again, for only 1/2/2007 and 2/2/2007
data2 <- data1[(data1$Date == "1/2/2007" | data1$Date == "2/2/2007"),]
head(data2)

##now combine Date and Time and format as Date/Time varibale 
date_char <- as.character(data2$Date)
time_char <- as.character(data2$Time)

date_time <- paste(date_char, time_char)

data2_datetime <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S")
head(data2_datetime)

##before we can plot again global active power, need to convert global active
##power to numeric
gap_char <- as.character(data2$Global_active_power)
gap_num <- as.numeric(gap_char)

plot(data2_datetime, gap_num)

##now need to get all fancy with plot.

plot(data2_datetime, gap_num, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

##plot is now on screen so can save out.
dev.copy(png, file = "plot2.png", width = 480)
dev.off()
