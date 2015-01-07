################################################
## Course: Exploratory Data Analysis          ##
## Project 1                                  ##
## Script: plot1.R                            ##
################################################

#######################################
##  Step1: Read the data to R        ##
#######################################

cFileName <- "household_power_consumption.txt"

## only need the first 3 cols (Date, Time, Global active power)
cols <- c("character", "character", "numeric", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL") 

## Only need the date from 1/2/2007 0:00 to 2/7/2007 23:59
dfMyData <- read.table(cFileName,sep=";", skip=66637, nrows=2880, na.strings="?", colClasses=cols)
vHeader <- read.table(cFileName, header=TRUE, na.strings="?", nrows=1, sep=";", check.names=TRUE, colClasses=cols)						  
names(dfMyData) <- names(vHeader)

#######################################
##  Step2: Plotting                  ##
#######################################

png(filename = "plot1.png", width=480, height=480, units="px", pointsize=11.75, bg="transparent")
hist(dfMyData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

#######################################
## End of script -- Chih-Hao Lai     ##
#######################################
