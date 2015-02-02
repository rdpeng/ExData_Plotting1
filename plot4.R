##plot 4.
##use code from previous plots for reading in data, selecting two day period
##,date/time coversion and numeric coversions.

data1 <- read.csv("household_power_consumption.csv")
head(data1)

##create data2 for only 1/2/2007 and 2/2/2007
data2 <- data1[(data1$Date == "1/2/2007" | data1$Date == "2/2/2007"),]
head(data2)

##combine Date and Time and format as Date/Time varibale 
date_char <- as.character(data2$Date)
time_char <- as.character(data2$Time)

date_time <- paste(date_char, time_char)

data2_datetime <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S")
head(data2_datetime)

##going prepare all variables for 4 plots, run plot to make sure it matcher
##then do quad-plot at end. 

##PLOT1(global active power by weekday)

##already have date/time var, need gap.
gap_char <- as.character(data2$Global_active_power)
gap_num <- as.numeric(gap_char)

plot(data2_datetime, gap_num, type = "l", xlab = "", ylab = "Global Active Power")

##PLOT2(Voltage by weekday)

##need voltage converted.
volt_char <- as.character(data2$Voltage)
volt_num <- as.numeric(volt_char)

plot(data2_datetime, volt_num, xlab = "datetime", ylab = "Voltage", type = "l")

##PLOT3(sub meter plot, plot3 code)

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

##PLOT4(global reactive power by weekday)
grp_char <- as.character(data2$Global_reactive_power)
grp_num <- as.numeric(grp_char)

with(data2, plot(data2_datetime, grp_num, type = "l", xlab = "datetime",
ylab = "Global_reactive_power"))

##Quad plot funnsies. 
par(mfrow = c(2,2))

##PLOT1
plot(data2_datetime, gap_num, type = "l", xlab = "", ylab = "Global Active Power")

##PLOT2
plot(data2_datetime, volt_num, xlab = "datetime", ylab = "Voltage", type = "l")

##PLOT3
plot(data2_datetime,sub1_num, xlab = "", ylab = "Engery sub metering", type = "l")
lines(data2_datetime, sub2_num, col = "red")
lines(data2_datetime, sub3_num, col = "blue")
##lastly add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
 "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"),bty = "n")

##PLOT4
plot(data2_datetime, grp_num, type = "l", xlab = "datetime",ylab = "Global_reactive_power")

##save out!
dev.copy(png, file = "plot4.png", width = 480)
dev.off()