# Introduction
#
# This assignment uses data from the UC Irvine Machine Learning Repository, a
# popular repository for machine learning datasets. In particular, we will be
# using the “Individual household electric power consumption Data Set” which I
# have made available on the course web site:
#
# Dataset: Electric power consumption [20Mb]
#
# Description: Measurements of electric power consumption in one household with
# a one-minute sampling rate over a period of almost 4 years. Different
# electrical quantities and some sub-metering values are available.
#
# The following descriptions of the 9 variables in the dataset are taken from
# the UCI web site:
#
# Date: Date in format dd/mm/yyyy Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in
# kilowatt) Global_reactive_power: household global minute-averaged reactive
# power (in kilowatt) Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in
# ampere) Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active
# energy). It corresponds to the kitchen, containing mainly a dishwasher, an
# oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It
# corresponds to the laundry room, containing a washing-machine, a tumble-drier,
# a refrigerator and a light. Sub_metering_3: energy sub-metering No. 3 (in
# watt-hour of active energy). It corresponds to an electric water-heater and an
# air-conditioner. Loading the data
#
# When loading the dataset into R, please consider the following:
#
# The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate
# of how much memory the dataset will require in memory before reading into R.
# Make sure your computer has enough memory (most modern computers should be
# fine).
#
# We will only be using data from the dates 2007-02-01 and 2007-02-02. One
# alternative is to read the data from just those dates rather than reading in
# the entire dataset and subsetting to those dates.
#


# You may find it useful to convert the Date and Time variables to Date/Time
# classes in R using the strptime() and as.Date() functions.
#
# Note that in this dataset missing values are coded as ?.
library(data.table)
library(xts)
library(dplyr)
library(lubridate)

#Set path to csv
path2txt <- paste0(getwd(),"/household_power_consumption.txt")


#read in csv as a dataframe
mydf <- read.csv2(path2txt,
                  #skip down to the rows of interest          #Grab 2 days of data
                  skip=grep("^1/2/2007", readLines(path2txt)), nrows=2*24*60,
                  stringsAsFactors = FALSE,header = FALSE )

#create data frame table
hpc<-tbl_df(mydf)



setnames(hpc, old = 1:9, new = strsplit(readLines(path2txt,n=1),";")[[1]])

hpcNoDateTime <- select(hpc, 3:9)


hpcDateTime <- paste( hpc$Date, hpc$Time,sep = " ")

hpcDateTime <- strptime( hpcDateTime,"%d/%m/%Y %H:%M:%S")

### The R compiler shows error in syntax here, but it is not real
## this line executes as it should dispite the compile time error
weekday <- wday(x = hpcDateTime,abbr = TRUE,label = TRUE)


row.names(hpcNoDateTime) <- hpcDateTime

hpcTimeSeries <- hpcNoDateTime

hpcTimeSeries<- as.data.frame(sapply(hpcTimeSeries, as.numeric))

hpcXTS <- xts(hpcTimeSeries, order.by=hpcDateTime)
# Making Plots
#
# Our overall goal here is simply to examine how household energy usage varies
# over a 2-day period in February, 2007. Your task is to reconstruct the
# following plots below, all of which were constructed using the base plotting
# system.
#
# First you will need to fork and clone the following GitHub repository:
# https://github.com/rdpeng/ExData_Plotting1
#
# For each plot you should
#
# Save it to a PNG file
#
# Name each of the plot files as plot1.png, plot2.png, etc.
png(filename = paste0(getwd(),"/plot3.png"), width = 480, height = 480)
# with a width of 480 pixels and a height of 480 pixels.

# Construct the plot
plot(hpcXTS[,5],
     ylab = "Energy sub meterings",
     major.ticks='days',
     minor.ticks=FALSE,
     col="black",
     major.format = as.character(unique(weekday)),main="")

lines(hpcXTS[,6],
     col="red")

lines(hpcXTS[,7],
     col="blue")

legend("topright",lty = 1, col=c("black","red","blue"),legend = names(hpcXTS[,5:7]))

dev.off()
