###    Scritp to plot figure 4 --- 1st Project Exploratory Data 
### Analysis

# Reading the data just between the period I want to directly, need data.table
# package. If you dont have it, just type install.packages("data.table")
library("data.table") ## Loading the package that allows me to use fread

## Knowing the time difference in minutes between the desired dates
interval_mins <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"),units="mins")
## Converting to numeric - number of rows 
number_rows <- as.numeric(interval_mins)

## Reading just the number of rows I specified starting from skip 
power_consum <- fread("household_power_consumption.txt", skip="1/2/2007", nrows = number_rows, 
                      sep=";", na.strings = c("?", ""))
## Reading the header of the file to include in the data frame
header <- scan("household_power_consumption.txt", nlines = 1, sep = ";", what = character())

## Renaming the data.frame with the correct names from header
setnames(power_consum, old=names(power_consum),new=header)

## Creating the variables to plot
global_power <- power_consum$Global_active_power   #PLOT1

sub_m1 <- power_consum$Sub_metering_1
sub_m2 <- power_consum$Sub_metering_2              #PLOT2
sub_m3 <- power_consum$Sub_metering_3

volt <-power_consum$Voltage                        #PLOT3

glob_react <- power_consum$Global_reactive_power   #PLOT4

time <- as.POSIXct(paste(power_consum$Date, power_consum$Time), format="%d/%m/%Y %H:%M:%S")

# Setting the language in english otherwise the weekdays plotted on the figure will be
# in Portuguese
Sys.setlocale(category = "LC_TIME", locale = "C")

# Specifying the number of plots in the same figure column-wise
png(file = "plot4.png", width = 480, height = 480, bg = "transparent")

par(mfcol= c(2,2))

######## PLOT 1
plot(time,global_power, ylab="Global active power (killowats)", xlab= "",type="n")
lines(time,global_power)

######## PLOT 2
plot(c(rep(time,3)),c(sub_m1,sub_m2,sub_m3),ylab="Energy sub metering", xlab= "",type="n")

lines(time,sub_m1,col ="black")
lines(time,sub_m2,col ="red")
lines(time,sub_m3,col ="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), col = c("black", "red", "blue"), bty = "n")

######## PLOT 3
plot(time,volt, ylab="Voltage", xlab= "datetime",type="n")
lines(time,volt)

######## PLOT 1
plot(time,glob_react, ylab="Global_reactive_power", xlab= "datetime",type="n")
lines(time,glob_react)

dev.off()







