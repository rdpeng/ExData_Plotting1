##change directory to assignment1 in data exploration file
##this is where I saved data file. 

data1 <- read.csv("household_power_consumption.csv")
head(data1)

##for plot 3, need to plot date/time by global active power. 
##create data2 again, for only 1/2/2007 and 2/2/2007
data2 <- data1[(data1$Date == "1/2/2007" | data1$Date == "2/2/2007"),]
head(data2)

##we need to plot all three sub meters and date/time.
##use date/time code from plot 2.

##combine Date and Time and format as Date/Time varibale 
date_char <- as.character(data2$Date)
time_char <- as.character(data2$Time)

date_time <- paste(date_char, time_char)

data2_datetime <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S")
head(data2_datetime)

##now need to format sub meter from factor to char to num.
sub1_char = as.character(data2$Sub_metering_1)
sub1_num = as.numeric(sub1_char)

sub2_char = as.character(data2$Sub_metering_2)
sub2_num = as.numeric(sub2_char)

sub3_char = as.character(data2$Sub_metering_3)
sub3_num = as.numeric(sub3_char)

##create frame of graph with sub1, then layer on sub2 and 3.
plot(data2_datetime,sub1_num, xlab = "", ylab = "Engery sub metering", type = "l")
lines(data2_datetime, sub2_num, col = "red")
lines(data2_datetime, sub3_num, col = "blue")

##lastly add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
 "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"))

##save out png.
dev.copy(png, file = "plot3.png", width = 480)
dev.off()
