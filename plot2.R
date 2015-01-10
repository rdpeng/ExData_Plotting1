###    Scritp to plot figure 2 --- 1st Project Exploratory Data 
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
global_power <- power_consum$Global_active_power
time <- as.POSIXct(paste(power_consum$Date, power_consum$Time), format="%d/%m/%Y %H:%M:%S") 

# Setting the language in english otherwise the weekdays plotted on the figure will be
# in Portuguese
Sys.setlocale(category = "LC_TIME", locale = "C")

##Plotting first the invisivel dots and then using the solid line
plot(time,global_power, ylab="Global active power (killowats)", xlab= "",type="n")
lines(time,global_power)

## Defining the place to print the figure
dev.copy(png, file="plot2.png", width = 480, height = 480, bg = "transparent") 
dev.off()
