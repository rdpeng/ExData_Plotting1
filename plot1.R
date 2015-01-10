###    Scritp to plot figure 1 --- 1st Project Exploratory Data 
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

## Defining the place to print the figure
png(file = "plot1.png", width = 480, height = 480, bg = "transparent")

## Plotting the histogram and add title on it
hist(power_consum$Global_active_power, xlab="Global active power (killowats)", ylab="Frequency", 
                                       main ="Global Active Power", col = "red")

dev.off()